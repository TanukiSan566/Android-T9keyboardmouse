package kmt;

import android.content.Context;
import android.hardware.camera2.CameraManager;
import android.os.Binder;
import android.os.Build;
import android.os.IBinder;
import android.os.Looper;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * keymouse 手电筒助手 (由 root 守护进程用 app_process 启动)。
 *
 * 这台机器的闪光灯 (flash-aw3641) 由相机系统服务接管，系统自带手电筒走的是
 * CameraService.setTorchMode。相机服务会记住"开灯的客户端 Binder"，客户端进程
 * 一退出就自动关灯，所以开灯后本进程必须一直活着；关灯 = 守护进程给本进程发 SIGTERM。
 *
 * 上一版实测: 直接反射 ICameraService.setTorchMode 抛 NoSuchMethodException
 * (多半是隐藏API限制)。这一版:
 *   0. 先申请豁免隐藏API检查；
 *   1. 方案A: 按"方法名"在 ICameraService 里找 setTorchMode，按参数类型自动凑参数；
 *   2. 方案B: 方案A不行就用公开API CameraManager.setTorchMode (用系统 Context)；
 *   每一步的结果和异常都会打到日志 ([torch] 开头)，失败了也能看出卡在哪。
 */
public class KmTorch {
    private static final IBinder TOKEN = new Binder();
    private static volatile Runnable offAction = null;

    private static void log(String s) {
        System.out.println("[torch] " + s);
        System.out.flush();
    }

    private static Throwable root(Throwable t) {
        while (t instanceof InvocationTargetException && t.getCause() != null) t = t.getCause();
        return t;
    }

    private static void exemptHiddenApis() {
        try {
            Method forName = Class.class.getDeclaredMethod("forName", String.class);
            Method getDeclaredMethod = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, Class[].class);
            Class<?> vmRuntime = (Class<?>) forName.invoke(null, "dalvik.system.VMRuntime");
            Method getRuntime = (Method) getDeclaredMethod.invoke(vmRuntime, "getRuntime", null);
            Method setEx = (Method) getDeclaredMethod.invoke(vmRuntime, "setHiddenApiExemptions", new Class[] { String[].class });
            Object vm = getRuntime.invoke(null);
            setEx.invoke(vm, new Object[] { new String[] { "L" } });
            log("已申请豁免隐藏API检查");
        } catch (Throwable t) {
            log("豁免隐藏API失败(可忽略): " + root(t));
        }
    }

    /* ---------------- 方案A: 直接调 ICameraService ---------------- */
    private static boolean tryDirect(final String[] ids) {
        try {
            Class<?> sm = Class.forName("android.os.ServiceManager");
            IBinder b = (IBinder) sm.getMethod("getService", String.class).invoke(null, "media.camera");
            if (b == null) { log("A: 找不到 media.camera 服务"); return false; }
            Class<?> iface = Class.forName("android.hardware.ICameraService");
            Class<?> stub = Class.forName("android.hardware.ICameraService$Stub");
            final Object svc = stub.getMethod("asInterface", IBinder.class).invoke(null, b);

            StringBuilder names = new StringBuilder();
            Method found = null;
            for (Method m : iface.getMethods()) {
                names.append(m.getName()).append(' ');
                if (m.getName().equals("setTorchMode") && found == null) found = m;
            }
            if (found == null) {
                for (Method m : iface.getDeclaredMethods()) {
                    if (m.getName().equals("setTorchMode")) { found = m; break; }
                }
            }
            if (found == null) {
                log("A: 接口里没有 setTorchMode。接口方法: " + names);
                return false;
            }
            final Method setTorch = found;
            final Class<?>[] pt = setTorch.getParameterTypes();
            StringBuilder sig = new StringBuilder();
            for (Class<?> c : pt) sig.append(c.getSimpleName()).append(' ');
            log("A: 找到 setTorchMode(" + sig.toString().trim() + ")");

            for (final String id : ids) {
                try {
                    invokeTorch(svc, setTorch, pt, id, true);
                    log("手电筒已打开 (方案A) cameraId=" + id);
                    offAction = new Runnable() {
                        public void run() {
                            try { invokeTorch(svc, setTorch, pt, id, false); log("手电筒已关闭 cameraId=" + id); }
                            catch (Throwable t) { log("关闭时出错: " + root(t)); }
                        }
                    };
                    return true;
                } catch (Throwable t) {
                    log("A: cameraId=" + id + " 打开失败: " + root(t));
                }
            }
        } catch (Throwable t) {
            log("A: 失败: " + root(t));
        }
        return false;
    }

    private static void invokeTorch(Object svc, Method m, Class<?>[] pt, String id, boolean on) throws Throwable {
        Object[] args = new Object[pt.length];
        boolean idSet = false, boolSet = false;
        for (int i = 0; i < pt.length; i++) {
            Class<?> c = pt[i];
            if (c == String.class) { args[i] = idSet ? "com.android.shell" : id; idSet = true; }
            else if (c == boolean.class) { args[i] = on; boolSet = true; }
            else if (c == IBinder.class) args[i] = TOKEN;
            else if (c == int.class) args[i] = 0;
            else args[i] = null;
        }
        if (!boolSet) throw new IllegalStateException("setTorchMode 没有 boolean 参数");
        try {
            m.invoke(svc, args);
        } catch (InvocationTargetException e) {
            throw e.getCause() != null ? e.getCause() : e;
        }
    }

    /* ---------------- 方案B: 公开API CameraManager ---------------- */
    private static boolean tryCameraManager(String[] ids) {
        try {
            if (Looper.getMainLooper() == null) Looper.prepareMainLooper();
            Class<?> at = Class.forName("android.app.ActivityThread");
            Object t = at.getMethod("systemMain").invoke(null);
            Context ctx = (Context) at.getMethod("getSystemContext").invoke(t);
            final CameraManager cm = (CameraManager) ctx.getSystemService(Context.CAMERA_SERVICE);
            if (cm == null) { log("B: 拿不到 CameraManager"); return false; }
            StringBuilder have = new StringBuilder();
            try { for (String s : cm.getCameraIdList()) have.append(s).append(' '); } catch (Throwable t2) { have.append("(读取失败 ").append(root(t2)).append(')'); }
            log("B: 系统相机列表: " + have);
            for (final String id : ids) {
                try {
                    cm.setTorchMode(id, true);
                    log("手电筒已打开 (方案B) cameraId=" + id);
                    offAction = new Runnable() {
                        public void run() {
                            try { cm.setTorchMode(id, false); log("手电筒已关闭 cameraId=" + id); }
                            catch (Throwable t3) { log("关闭时出错: " + root(t3)); }
                        }
                    };
                    return true;
                } catch (Throwable t2) {
                    log("B: cameraId=" + id + " 打开失败: " + root(t2));
                }
            }
        } catch (Throwable t) {
            log("B: 失败: " + root(t));
        }
        return false;
    }

    public static void main(String[] args) {
        String want = args.length > 0 ? args[0] : "auto";
        String[] ids = "auto".equals(want) ? new String[] { "0", "1", "2", "3" } : new String[] { want };
        log("助手启动 SDK=" + Build.VERSION.SDK_INT + " " + Build.MANUFACTURER + " " + Build.MODEL);
        exemptHiddenApis();

        if (!tryDirect(ids) && !tryCameraManager(ids)) {
            log("所有方案都没能打开手电筒");
            System.exit(3);
        }

        Runtime.getRuntime().addShutdownHook(new Thread() {
            public void run() {
                Runnable r = offAction;
                if (r != null) r.run();
            }
        });

        try {
            while (true) Thread.sleep(3600000L);
        } catch (InterruptedException e) {
            // 退出
        }
    }
}

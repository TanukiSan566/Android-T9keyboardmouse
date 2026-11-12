package com.keymouse.tool;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import java.io.File;
import java.io.FileOutputStream;

/**
 * 前台服务: 让 App 进程常驻(前台服务进程不会被 lmkd 当缓存进程优先杀掉)，
 * 红点和弹窗都在这个进程里画。必须是真正的 App 进程——WindowManagerService
 * 不给 root 的 app_process 开窗口会话(日志: Session: Unknown pid=.. uid=0)。
 * 每秒写心跳 files/keymouse_app_alive，守护进程看门狗靠它判断要不要重新拉起本服务。
 */
public class KeepAliveService extends Service {
    private Handler h;
    private File alive;
    private final Runnable beat = new Runnable() {
        public void run() {
            try {
                FileOutputStream o = new FileOutputStream(alive);
                o.write(1);
                o.close();
                alive.setReadable(true, false);
            } catch (Throwable t) {
                // 忽略
            }
            if (h != null) h.postDelayed(this, 1000);
        }
    };

    @Override
    public IBinder onBind(Intent i) {
        return null;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        alive = new File(getFilesDir(), "keymouse_app_alive");
        h = new Handler(Looper.getMainLooper());
        try {
            NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
            nm.createNotificationChannel(new NotificationChannel("km_keepalive", "KeyMouse",
                    NotificationManager.IMPORTANCE_MIN));
            Notification n = new Notification.Builder(this, "km_keepalive")
                    .setSmallIcon(android.R.drawable.ic_menu_compass)
                    .setContentTitle("KeyMouse")
                    .build();
            startForeground(7, n);
        } catch (Throwable t) {
            // 即使通知失败也继续
        }
        h.post(beat);
        PosDot.start(this);
    }

    @Override
    public int onStartCommand(Intent i, int f, int id) {
        PosDot.start(this);
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        if (h != null) h.removeCallbacks(beat);
        PosDot.stop();
        super.onDestroy();
    }
}

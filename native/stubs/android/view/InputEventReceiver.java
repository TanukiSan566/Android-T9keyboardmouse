package android.view;

import android.os.Looper;

/** 仅用于编译的占位类：运行时用的是系统框架里真正的 InputEventReceiver，本类不会进 dex。 */
public abstract class InputEventReceiver {
    public InputEventReceiver(InputChannel inputChannel, Looper looper) {
    }

    public void onInputEvent(InputEvent event) {
    }

    public void onBatchedInputEventPending(int source) {
    }

    public final boolean consumeBatchedInputEvents(long frameTimeNanos) {
        return false;
    }

    public final void finishInputEvent(InputEvent event, boolean handled) {
    }

    public void dispose() {
    }
}

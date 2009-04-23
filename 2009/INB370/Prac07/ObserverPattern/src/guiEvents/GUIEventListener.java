/**
 * 
 */
package guiEvents;

import java.util.EventListener;

/**
 * EventListener interface for the GUIEvents problem 
 * @author hogan
 *
 */
public interface GUIEventListener extends EventListener {
	public void guiActionPerformed(GUIEvent evt);
}

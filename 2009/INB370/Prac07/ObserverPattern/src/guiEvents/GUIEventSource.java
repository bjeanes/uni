/**
 * 
 */
package guiEvents;

/**
 * Event source interface for GUIEvents  
 * @author hogan
 *
 */
public interface GUIEventSource {
	public void addGUIEventListener(GUIEventListener g); 
	public void removeGUIEventListener(GUIEventListener o);
	public void fireGUIEvent(); 
	
	//doClick wouldn't normally be specified in the interface.
	//It is used here so that the simulation class knows about it.
	public void doClick();
}

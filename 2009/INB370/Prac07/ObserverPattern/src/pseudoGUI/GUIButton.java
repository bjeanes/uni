/**
 * 
 */
package pseudoGUI;

import guiEvents.GUIEvent;
import guiEvents.GUIEventListener;
import guiEvents.GUIEventSource;

import java.util.ListIterator;
import java.util.Vector;


/**
 * The Concrete Subject class for the Observer Pattern example 
 * @author hogan
 *
 */
public class GUIButton implements GUIEventSource {
	private String name; 
	private boolean clicked;
	private Vector<GUIEventListener> guiEventListeners; 
	
	public GUIButton(String nm) {
		this.name=nm;
		this.clicked=false; 
		this.guiEventListeners = new Vector<GUIEventListener>();
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void doClick() {
		clicked = true;
		fireGUIEvent();
		clicked = false;
	}

	public void fireGUIEvent() {
		ListIterator<GUIEventListener> iter = this.guiEventListeners.listIterator();
		while (iter.hasNext()) {
			iter.next().guiActionPerformed(new GUIEvent(this));
		}
	}

	public void addGUIEventListener(GUIEventListener gel) {
		guiEventListeners.add(gel);
	}

	public void removeGUIEventListener(GUIEventListener gel) {
		guiEventListeners.remove(gel);
	}
	public String toString() { 
		return "guiButton:" + this.name; 
	}
}

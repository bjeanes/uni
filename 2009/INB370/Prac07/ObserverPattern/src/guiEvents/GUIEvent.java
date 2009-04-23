package guiEvents;

import java.util.EventObject;

@SuppressWarnings("serial")
public class GUIEvent extends EventObject {

	/**
	 * Simple Event object to pass to listeners
	 * @param arg0
	 */
	public GUIEvent(Object arg0) {
		super(arg0);
	}
	
	public String toString() {
		return "GUIEvent";
	}
}

/**
 * 
 */
package patterns.observer;

/**
 * Subject interface for Observer pattern 
 * @author hogan
 *
 */
public interface Subject {
	public String getState();
	public void setState(String s);
	public void attachObserver(Observer o); 
	public void detachObserver(Observer o);
	public void notifyObservers(); 
}

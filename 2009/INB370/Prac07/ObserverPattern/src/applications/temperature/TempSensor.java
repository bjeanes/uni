/**
 * 
 */
package applications.temperature;

import java.util.ListIterator;
import java.util.Random;
import java.util.Vector;

import patterns.observer.Observer;
import patterns.observer.Subject;

/**
 * The Concrete Subject class for the Observer Pattern example 
 * @author hogan
 *
 */
public class TempSensor implements Subject {
	private double temp; 
	private double low; 
	private double high;
	private Random rng; 
	private Vector<Observer> observers; 
	
	public TempSensor(long seed,double high, double low) {
		this.rng=new Random(seed); 
		this.high=high;
		this.low=low;
		this.observers = new Vector<Observer>();
	}
	
	@Override
	public void setState(String s) {
		double range = this.high-this.low;
		this.temp=Math.round(rng.nextDouble()*range+this.low);
	}
	
	@Override
	public String getState() {
		return this.temp + "";
	}

	@Override
	public void attachObserver(Observer o) {
		this.observers.add(o);
	}

	@Override
	public void detachObserver(Observer o) {
		this.observers.remove(o);
	}

	@Override
	public void notifyObservers() {
		ListIterator<Observer> iter = this.observers.listIterator();
		while (iter.hasNext()) {
			iter.next().update(this);
		}
		
	}



}

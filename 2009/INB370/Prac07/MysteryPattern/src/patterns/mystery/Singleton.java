package patterns.mystery;

public class Singleton {
	private String name; 
	private Singleton (String s) {
		this.name=s; 
	}
	 
	private static class MysteryHolder { 
	   private final static Singleton INSTANCE = new Singleton("MysteryHolder Call");
	}
	
	public static Singleton getInstance() {
	   return MysteryHolder.INSTANCE;
	}
	
	public void HereIAm() {
		System.out.println("This is a mystery class");
		System.out.println("My name is: "+this.name); 
	}
}

package superheroes;

public class EnhancedHuman extends SuperHero {
	public EnhancedHuman(String normalIdentity, String enhancedIdentity, SuperPower[] acquiredPowers) {
		super(normalIdentity, enhancedIdentity);
		// TODO add powers to a collection
	}
	
	public int totalPower() {
		if(this.currentIdentity == 0) {
			return 0;
		} else {
			return super.totalPower();
		}
	}
	
	public boolean hasPower(SuperPower queriedPower) {
		if(this.currentIdentity == 0) {
			return false;
		} else {
			return super.hasPower(queriedPower);
		}
	}
}

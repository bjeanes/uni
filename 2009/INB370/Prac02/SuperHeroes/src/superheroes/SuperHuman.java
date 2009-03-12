package superheroes;

public class SuperHuman extends SuperHero {
	
	public SuperHuman(String realName, String secretIdentity, SuperPower[] innatePowers) {
		super(realName, secretIdentity);
		acquirePowers(innatePowers);
	}
	
	public void acquirePowers(SuperPower[] powers) {
		for(SuperPower power : powers) {
			this.powers.add(power);
		}
	}
	
	public void losePowers(SuperPower[] powers) {
		for(SuperPower power : powers) {
			this.powers.remove(power);
		}
	}
};

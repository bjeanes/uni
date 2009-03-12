package superheroes;

import java.util.*;

public abstract class SuperHero implements Hero {
	
	protected Set<SuperPower> powers;
	protected String[] identities = {"", ""};
	protected int currentIdentity = 0; // 0 for true, 1 for alter
	
	public SuperHero(String trueIdentity, String alterEgo) {
		this.identities[0] = trueIdentity;
		this.identities[1] = alterEgo;
		this.powers = new HashSet<SuperPower>();
	}
	
	public String currentIdentity() {
		return this.identities[this.currentIdentity];
	}
	
	public void switchIdentity() {
		this.currentIdentity = (this.currentIdentity + 1) % 2;
	}
	
	public boolean hasPower(SuperPower queriedPower) {
		return powers.contains(queriedPower);
	}
	
	public int totalPower() {
		int totalPower = 0;
		for(SuperPower power : this.powers) {
			totalPower += power.getValue();
		}
		return totalPower;
	}
}

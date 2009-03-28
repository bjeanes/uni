package inb370.asgn1;

import java.util.Random;
import java.util.Set;
import java.util.HashSet;

public class HiringGame implements IHiringGame {
	private int maxApplicants;
	private Random random;
	private Set<Applicant> awaitingApplicants;
	private Set<Applicant> allApplicants;
	private Applicant current;
	private Applicant accepted;

	@Override
	public void acceptApplicant() throws HiringException {
		ensureGameHasStarted();
		ensureGameHasNotConcluded();
	}

	@Override
	public Applicant getBestApplicant() throws HiringException {
		ensureGameHasStarted();
		ensureGameHasConcluded();
		
		Applicant best = null;
		
		for(Applicant applicant : allApplicants) {
			if(best == null || applicant.getQualityScore() > best.getQualityScore()) {
				best = applicant;
			}
		}
		
		return best;
	}

	@Override
	public Applicant getNextApplicant() throws HiringException {
		ensureGameHasStarted();
		ensureGameHasNotConcluded();
		
		if(current != null) awaitingApplicants.remove(current);
		
		int nextIndex = random.nextInt(awaitingApplicants.size());
		current = (Applicant)awaitingApplicants.toArray()[nextIndex];

		return current;
	}

	@Override
	public boolean isAccepted() throws HiringException {
		ensureGameHasStarted();
		
		return (accepted != null);
	}

	@Override
	public boolean isBestApplicant() throws HiringException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void newGame(int maxApplicants, Random random)
			throws HiringException {
		if(maxApplicants < 1) 
			throw new HiringException("There must be at least 1 applicant.");
		if(random == null)
			throw new HiringException("HiringGame requires a Random object.");
		
		this.maxApplicants = maxApplicants;
		this.random = random;
		this.awaitingApplicants = new HashSet<Applicant>();
		
		for(int i = 0; i < maxApplicants; i++) {
			awaitingApplicants.add(new Applicant(i, random.nextDouble()));
		}

	}
	
	private void ensureGameHasStarted() throws HiringException {
		if(maxApplicants == 0)
			throw new HiringException("Game has not started.");
	}
	
	private void ensureGameHasConcluded() throws HiringException {
		if(!isAccepted()) 
			throw new HiringException("Game has not been concluded.");
	}
	
	private void ensureGameHasNotConcluded() throws HiringException {
		if(isAccepted()) 
			throw new HiringException("Game has concluded.");
	}

}

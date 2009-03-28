package inb370.asgn1;

import java.util.Random;

public class HiringGame implements IHiringGame {
	private int maxApplicants;
	private Random random;
	private Applicant[] applicants;
	private Applicant accepted;

	@Override
	public void acceptApplicant() throws HiringException {
		// TODO Auto-generated method stub

	}

	@Override
	public Applicant getBestApplicant() throws HiringException {
		if(applicants == null) throw new HiringException("There are no applicants.");
		if(accepted == null) throw new HiringException("No applicant has been accepted yet.");
		
		Applicant best = null;
		
		for(Applicant applicant : applicants) {
			if(best == null || applicant.getQualityScore() > best.getQualityScore()) {
				best = applicant;
			}
		}
		
		return best;
	}

	@Override
	public Applicant getNextApplicant() throws HiringException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccepted() throws HiringException {
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
		this.applicants = new Applicant[maxApplicants];
		
		for(int i = 0; i < maxApplicants; i++) {
			applicants[i] = new Applicant(i, random.nextDouble());
		}

	}

}

package inb370.asgn1;

import java.util.Random;

public class HiringGame implements IHiringGame {
	private int maxApplicants;
	private Random random;
	private Applicant[] applicants;

	@Override
	public void acceptApplicant() throws HiringException {
		// TODO Auto-generated method stub

	}

	@Override
	public Applicant getBestApplicant() throws HiringException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Applicant getNextApplicant() throws HiringException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccepted() throws HiringException {
		// TODO Auto-generated method stub
		return false;
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

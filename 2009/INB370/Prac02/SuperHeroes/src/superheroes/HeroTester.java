package superheroes;

import java.io.*;

/* 
 * This program tests the implementation of your "Hero" type hierarchy.
 * The values displayed in square brackets are the expected answers.
 */
public class HeroTester {

	public static void main(String[] args) {

		/* Declare a "screen" object for displaying test results */
		PrintWriter screen = new PrintWriter(System.out, true);

		/* Declare some 1940s and 1950s superheroes of interest */

		/* Batman and the Black Canary are mere mortals */
		Human Batman = 
			new Human("Bruce Wayne", "Batman");
		Human BlackCanary = 
			new Human("Dinah Drake", "Black Canary");

		/* Superman and Wonder Woman are superhumans */
		SuperHuman WonderWoman = 
			new SuperHuman("Wonder Woman", 
					"Diana Prince",
					new SuperPower[]{SuperPower.SuperStrength,
					SuperPower.SuperIntellect});
		SuperHuman Superman = 
			new SuperHuman("Superman", 
					"Clark Kent",
					new SuperPower[] {SuperPower.Flight,
					SuperPower.SuperStrength,
					SuperPower.XRayVision,
					SuperPower.SuperSpeed,
					SuperPower.Invulnerability});

		/* Captain Marvel and Green Lantern are humans who
		 * acquire their powers temporarily */
		EnhancedHuman CaptainMarvel = 
			new EnhancedHuman("Billy Batson",
					"Captain Marvel",
					new SuperPower[] {SuperPower.Flight,
					SuperPower.SuperStrength,
					SuperPower.Invulnerability});
		EnhancedHuman GreenLantern = 
			new EnhancedHuman("Hal Jordan",
					"Green Lantern",
					new SuperPower[] {SuperPower.Flight,
					SuperPower.SuperStrength,
					SuperPower.SuperSpeed,
					SuperPower.Invulnerability});

		/* Let's test the simplest kind of superheroes, mortals */
		screen.println(" 1. In his normal identity Batman has no " +
				"superpowers [Bruce Wayne, 0]: " + 
				Batman.currentIdentity() + ", " +
				Batman.totalPower());
		Batman.switchIdentity();
		screen.println(" 2. After switching identity Batman still " +
				"has no powers [Batman, 0]: " +
				Batman.currentIdentity() + ", " +
				Batman.totalPower());
		screen.println(" 3. Batman's change of identity shouldn't " +
				"alter the Black Canary's identity [Dinah Drake]: " + 
				BlackCanary.currentIdentity());
		screen.println(" 4. Can Batman fly when wearing his cape? " +
				"[No]: " +
				(Batman.hasPower(SuperPower.Flight) ?
						"Yes" : "No"));
		screen.println();

		/* Now let's try enhanced humans */
		screen.println(" 5. As a mortal Captain Marvel is " +
				"meek and has no powers [Billy Batson, 0]: " + 
				CaptainMarvel.currentIdentity() + ", " +
				CaptainMarvel.totalPower());
		CaptainMarvel.switchIdentity();
		screen.println(" 6. After Billy Batson says the magic word " +
				"'SHAZAM' he becomes a mighty hero [Captain Marvel, " +
				"325]: " +	CaptainMarvel.currentIdentity() + ", " +
		        CaptainMarvel.totalPower());
		screen.println(" 7. Does Captain Marvel have super strength? " +
				"[Yes]: " +
				(CaptainMarvel.hasPower(SuperPower.SuperStrength) ?
						"Yes" : "No"));
		screen.println(" 8. Does Captain Marvel have X-ray vision? " +
				"[No]: " +
				(CaptainMarvel.hasPower(SuperPower.XRayVision) ?
						"Yes" : "No"));
		screen.println(" 9. Similarly, Green Lantern was born a plain " +
				"mortal [Hal Jordan, 0]: " +
				GreenLantern.currentIdentity() + ", " +
		        GreenLantern.totalPower());
		GreenLantern.switchIdentity();
		screen.println("10. But he can become a superhero via his " +
				"power ring [Green Lantern, 365]: " +
				GreenLantern.currentIdentity() + ", " +
				GreenLantern.totalPower());
		GreenLantern.switchIdentity();
		screen.println("11. But unless he recharges the ring " +
				"every day he changes back [Hal Jordan, 0]: " +
				GreenLantern.currentIdentity() + ", " +
		        GreenLantern.totalPower());
		screen.println();
		
		/* Finally, let's try superhumans */
		screen.println("12. When he first arrived on Earth, Superman had " +
				"incredible powers [Superman, 385]: " + 
				Superman.currentIdentity() + ", " +
		        Superman.totalPower());
		Superman.switchIdentity();
		screen.println("13. He secretly retains his powers even in his " +
				"secret identity [Clark Kent, 385]: " + 
				Superman.currentIdentity() + ", " +
		        Superman.totalPower());
		Superman.losePowers(new SuperPower[] {SuperPower.SuperStrength, 
				SuperPower.Invulnerability});
		screen.println("14. However, when exposed to kryponite he loses " +
				"his strength and invulnerability [160]: " +
				Superman.totalPower());
		screen.println("15. However, kryptonite has " +
				"no effect on Wonder Woman " +
				"who retains her full complement of powers [165]: " +
				WonderWoman.totalPower());
		WonderWoman.switchIdentity();
		screen.println("16. When she switches to her plain identity " +
				"does she still retain 'the Wisdom of Athena' [Yes]: " +
				(WonderWoman.hasPower(SuperPower.SuperIntellect) ?
						"Yes" : "No"));
		Superman.acquirePowers(new SuperPower[] {SuperPower.Invulnerability, 
				SuperPower.SuperStrength});
		screen.println("17. Fortunately, when the kryptonite is removed " +
				"Superman gets his original powers back [385]: " +
				Superman.totalPower());
	}

}

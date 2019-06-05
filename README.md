### Nathan Cook and Timothy Stansberry
# Description
	This game is a tower defense game.  It contains four types of enemy ships: normal, quick,
	heavy, and boss.  The normal ships are nothing special, quick ships are extra fast, heavy 
	ships have extra health (and are rather slow as a result), and the boss ship has slightly extra speed and extra health.  In 
	order to defend the off screen castle, the player is provided four defense options: rocket 
	launcher, laser shooter, cannon, and forcefield.  The rockets launcher shoots a tracking missle 
	at a ship, the laser shooter shoots a laser that can hit more than one ship, the cannon shoots 
	a cannon ball but at a fast rate, and forcefield slows down the ships in its range.  The aim of 
	the game is to survive all 10 levels and beat the boss.
	
# Directions
	1) Press the play button
	2) The game will start automatically and the next level will begin after a buffer, 
	after all enemies of the current level have been defeated.
	3) Using the money you gain by killing enemies select the type of defense you want by 
	clicking the box with its name. Then click on a green tile where you want to place it.
	If you decide you don't want that defense either get rid of it entirely by placing in 
	the box labeled "X" or select another defense.
	4) Keep doing step 2) until you beat all 10 levels. 
	5) Whatever you do, DO NOT press "D", or all your progress will be lost and you will be taken into "demo" mode.
	
# DEVELOPMENT LOG
###### May 17th:
	-Nathan: Studied up on how to play tower defense.
	
	-Timothy: Created the file, studied up on how to play tower defense.

###### May 20th:	
	-Nathan: Added classes and pictures with Timothy. We also discussed/debated on 
	the exact use of all our classes and made a few changes.
	
	-Timothy: Added classes and pictures, started on a few methods.

###### May 21st:
	-Nathan: Found pictures for our objects, worked with Timothy on creating methods.
	
	-Timothy: Worked on creating methods and played around with the implementation of 
	all of our classes.

###### May 22nd:
	-Nathan: Worked with visuals and essentially got our starting visuals working.
	
	-Timothy: Worked with force field class till realizing that it wasn't necessary, 
	started on method that calculates the closest ship to a defense.

###### May 23rd:
	-Nathan: Worked on the display path in class, then went after school with Timothy to 
	the Dojo where we worked on debugging the path. 
	
	-Timothy: Wasn't in class because of an AP Exam, but Nathan and I went to the Dojo 
	after school spent the time debugging the board generation, on his computer. Also 
	finished findNearest. Worked on the relationship between defense and projectile at home.

###### May 24th:
	-Nathan: Still trying to debug my path creation algorithm. 
	
	-Timothy: Caught our Development Log up to date, while also continuing my work on 
	defense/projectile from yesterday. Also helped Nathan debug his code. 


###### May 27th:
	- Nathan: finished debugging the randomly generated path and it works.  Also made 
	it so no squares of tiles appeared, making it more visually appealing and easier 
	to see the path.
	
	-Timothy: Helped Nathan look over his code. Mostly worked on writing the move algorithm 
	for the ships, which is now finished. It took a lot of sketching things out and talking 
	them over with myself. 

###### May 28th: 
	-Nathan: Made a normal ship and had it run smoothly as it rotates to change direction.
	
	-Timothy: Added a constructor for ships, which allowed us to test the move function. 
	Fixed bugs in the move function, and added modifications so that the ships disappear 
	and take damage away from the castle once they reach the end of the path.

###### May 29th:
	-Nathan: Worked on more visula stuff: can click on box for the spcified defence and 
	click to place the defense, shows the health bar of the castle, when the health is 0 
	displays a "Game Over" screen.
	
	-Timothy: Worked on finding images for all the towers in class, and was unable to work 
	at home due to a math test.

###### May 30th:
	-Nathan: Made it so that the defenses snapped to the closest tile that was available 
	(won't go on tiles where this is already a defense or a tile on the path).
	
	-Timothy: Added a feature that limits the amount of times a defense can shoot by using 
	a buffer. Also coded forcefield, which interacts with the tiles to slow ships down by 
	a certain percent. Went to Dojo after school with Nathan. Also finished the interactions 
	between the tiles affected by a forcefield and the ships, and the ships are now able to 
	slow down within the radius of a forcefield.
	
###### May 31st: 
	-Nathan:
	-Timothy: Worked in class to adjust the sizes of everything, in order to make the interface itself bigger. Also fixed errors with forcefields.
	
###### June 1st: 
	-Nathan: Added a loading screen. Fixed the bug of ships moving upward on the board. Coded 
	so that a white circle is shown around the defense and turns red if the mouse is over an 
	invalid placemet.
	
	-Timothy: Wrote code allowing the display the projectile movements I coded earlier. Though it is buggy, its a good place to start. Also added in code that allowed the defenses to only target ships within their range.
	
###### June 2nd: 
	-Nathan: Experimenting with the laser visual, though did not go as planned.
	
	-Timothy: Worked on individual projectile movements, instead of having them all just act as a "seeking missile". Coded cannonballs to fire in a straight line and explode on impact, and tried to get lasers to act as a straight line, but failed.
	
###### June 3rd: 
	-Nathan and Timothy: Coded together taking turns of who was typing.  Worked on creating different 
	levels with increasing difficulty and the last level having a boss.
	
###### June 4th: 
	-Nathan and Timothy: Fixed any last bugs in the project and experimented with the game mechanics so 
	the defences/ships weren't over powered.



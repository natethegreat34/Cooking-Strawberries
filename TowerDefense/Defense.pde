abstract class Defense {
  public double x;
  public double y;
  private int range;
  private int level;
  private int timer;

  abstract boolean attack();
  
  //Constructor for  general defenses, sets up private variables
  public Defense(double inX, double inY) {
    x = inX;
    y = inY;
    timer = 0;
    t.add(this);
  }

  //Checks whether or not a defense can shoot based on ships in its area and its buffer time
  public boolean canShoot() {
    if(findNearest(x,y) != null){
      if(sqrt ((float)(Math.pow((findNearest(x,y).getCoords()[0] - x - 72 ),2)) + (float)(Math.pow((findNearest(x,y).getCoords()[1] - y - 72),2)))  > range){
        return false;
      }
    }
    timer --;
    return timer <= 0;
  }

  //Finds the closest ship to a defense within its range, and returns it. Returns null if there isn't one in range.
  public Ship findNearest(double x, double y) {
    double lowestDistance = 100000;
    int index = -1;
    for (int a = 0; a < s.size(); a ++) {
      double[] coords = s.get(a).getCoords();
      double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
      //System.out.println("Distance: " + distance + "Range: " + range);
      if (distance < lowestDistance && distance <= range) {
        lowestDistance = distance;
        index = a;
        //System.out.println("TARGET ACQUIRED");
      }
    }
    if (index == -1) return null;
    return s.get(index);
  }

  //Supposed to upgrade the defense, not implemented yet
  public boolean upgrade() {
    level += 1;
    return true;
  }

  //Setter method for the level of the defense
  public boolean setLevel(int inputLevel) {
    level = inputLevel;
    return true;
  }

  //Returns the level of the defense
  public int getLevel() {
    return level;
  }

  //Setter method for the range of the defense
  public boolean setRange(int inputRange) {
    range = inputRange;
    return true;
  }
  
  //Accessor for range
  public int getRange() {
    return range;
  }

  //Returns the (x,y) coords in an array of a defense
  public double[] getCoords() {
    double[] coords = new double[2];
    coords[0] = x;
    coords[1] = y;
    return coords;
  }

  //Sets the buffer for shooting again, used after attack
  public void setTimer(int time) {
    timer = time;
  }
}


//Cannon
class Cannon extends Defense {
  //Constructor for cannons specifically
  public Cannon(double inX, double inY) {
    super(inX, inY);
    setRange(252);
    setLevel(1);
  }

  //Specific attack method for cannon, generates a cannonball and then resets the timer as long as there is a ship to fire at.
  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    //System.out.println(target);
    if (target != null) {
      Projectile shot = new CannonBall(target, coords[0] + 36, coords[1] + 36); 
      setTimer(30);
      return true;
    }
    return false;
  }
}

//Laser Shooter
class LaserShooter extends Defense {
  //Constructor for lasershooters
  public LaserShooter(double inX, double inY) {
    super(inX, inY);
    setRange(180);
    setLevel(1);
  }
  
  //Specific attack method for lasers, generates a laser then resets the buffer as long as there is a ship to fire at
  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    if (target != null) {
      Projectile shot = new Laser(target, coords[0], coords[1]); 
      setTimer(50);
      return true;
    }
    return false;
  }
}

//Rocket Launcher
class RocketLauncher extends Defense {
  //Constructor for rocket launchers
  public RocketLauncher(double inX, double inY) {
    super(inX, inY);
    setRange((int)(125));
    setTimer(0);
    setLevel(1);
  }

  //Specific attack method for rocket launchers, generates a rocket then resets the buffer as long as there is a ship to fire at
  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    //System.out.println(target);
    if (target != null) {
      Projectile shot = new Rocket(target, coords[0] + 36, coords[1] + 36); 
      setTimer(80);
      return true;
    }
    return false;
  }
}

//Force Field Generator, very different from the other three differences
class ForceFieldGen extends Defense {
  //Constructor for forcefields, works by going through the tiles in a 3x3 area and setting them to slow down ships that are on top of them
  public ForceFieldGen(double inX, double inY) {
    super(inX, inY);
    for (int x = -1; x < 2; x ++) {
      for (int y = -1; y < 2; y ++) {
        if ( (int) inY / 72 + y < board.length && (int) inY / 72 + y > 0 && (int) inX / 72 + x > 0 &&(int) inX / 72 + x < board[0].length) {
          board[((int) inY / 72) + y][((int) inX / 72) + x].increaseSlow(0.25);
        }
      }
    }
  }
  
  //Doesn't need to attack anything, just a placeholder
  public boolean attack() {
    return true;
  }
  
}

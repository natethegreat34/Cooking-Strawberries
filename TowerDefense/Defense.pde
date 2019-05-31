abstract class Defense {
  public double x;
  public double y;
  private int range;
  private int level;
  private int timer;

  abstract boolean attack();

  public Defense(double inX, double inY) {
    x = inX;
    y = inY;
    t.add(this);
  }
  
  public boolean canShoot() {
    timer --;
    return timer <= 0;
  }
  
  

  public Ship findNearest(double x, double y) {
    double lowestDistance = 100000;
    int index = -1;
    for (int a = 0; a < s.size(); a ++) {
      double[] coords = s.get(a).getCoords();
      double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
      if (distance < lowestDistance) {
        lowestDistance = distance;
        index = a;
      }
    }
    return s.get(index);
  }

  public boolean upgrade() {
    level += 1;
    return true;
  }

  public boolean setLevel(int inputLevel) {
    level = inputLevel;
    return true;
  }

  public int getLevel() {
    return level;
  }

  public boolean setRange(int inputRange) {
    range = inputRange;
    return true;
  }

  public double[] getCoords() {
    double[] coords = new double[2];
    coords[0] = x;
    coords[1] = y;
    return coords;
  }
}


//Cannon
class Cannon extends Defense {
  public Cannon(double inX, double inY) {
    super(inX, inY);
    setRange(-1000000000);
    setLevel(1);
  }

  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    Projectile shot = new CannonBall(target, coords[0], coords[1]); 
    return true;
  }
}

//Laser Shooter
class LaserShooter extends Defense {
  public LaserShooter(double inX, double inY){
    super(inX, inY);
  }
  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    Projectile shot = new Laser(target, coords[0], coords[1]); 
    return true;
  }
}

//Rocket Launcher
class RocketLauncher extends Defense {
  public RocketLauncher(double inX, double inY){
    super(inX, inY);
  }
  
  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    Projectile shot = new Rocket(target, coords[0], coords[1]); 
    return true;
  }
}

//Force Field Generator, creates seperate item force field
class ForceFieldGen extends Defense {
    public ForceFieldGen(double inX, double inY) {
      super(inX, inY);
      for (int x = -2; x < 3; x ++) {
        for (int y = -2; y < 3; y ++) {
          board[(int) inY / 72 ][(int) inX / 72 ].increaseSlow(0.25);
        }
      }
    }
    
    public boolean attack() {
      return true;
      //Doesn't need to attack anything
    }
}

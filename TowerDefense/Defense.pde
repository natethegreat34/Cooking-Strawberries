abstract class Defense {
  private double x;
  private double y;
  private int range;
  private int level;

  abstract boolean attack();
  public Defense(double u, double v){
    x = u;
    y = v;
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
  public Cannon() {
    setRange(-1000000000);
    setLevel(1);
  }

  public boolean attack() {
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    Projectile shot = new CannonBall(target, coords[0], coords[1]); 
    return true; 
  }
}

//Laser Shooter
class LaserShooter extends Defense {
  public boolean attack() {
    return true;
  }
}

//Rocket Launcher
class RocketLauncher extends Defense {
  public boolean attack() {
    return true;
  }
}

//Force Field Generator, creates seperate item force field
class ForceFieldGen extends Defense {
    public boolean attack() {
    return true;
  }
}

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
    timer = 0;
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
  public int getRange(){
  return range;
}

  public double[] getCoords() {
    double[] coords = new double[2];
    coords[0] = x;
    coords[1] = y;
    return coords;
  }
  
  public void setTimer(int time) {
    timer = time;
  }
}


//Cannon
class Cannon extends Defense {
  public Cannon(double inX, double inY) {
    super(inX, inY);
    setRange(50);
    setLevel(1);
  }

  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    //System.out.println(target);
    if (target != null) {
      Projectile shot = new CannonBall(target, coords[0], coords[1]); 
      setTimer(50);
      return true;
    }
    return false;
  }
  
  public Ship findNearest(double x, double y) {
    double lowestDistance = 100000;
    int index = -1;
    for (int a = 0; a < s.size(); a ++) {
      double[] coords = s.get(a).getCoords();
      double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
      if (distance < lowestDistance && distance < getRange()) {
        lowestDistance = distance;
        index = a;
        //System.out.println("TARGET ACQUIRED");
      }
    }
    if (index == -1) return null;
    return s.get(index);
  }
    
}

//Laser Shooter
class LaserShooter extends Defense {
  public LaserShooter(double inX, double inY) {
    super(inX, inY);
    setRange(50);
    setLevel(1);
  }
  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    Projectile shot = new Laser(target, coords[0], coords[1]); 
    setTimer(15);
    return true;
  }
}

//Rocket Launcher
class RocketLauncher extends Defense {
  public RocketLauncher(double inX, double inY) {
    super(inX, inY);
    setRange(200);
    setLevel(1);
  }

  public boolean attack() {
    if (! canShoot()) return  false;
    double coords[] = getCoords();
    Ship target = findNearest(coords[0], coords[1]);
    //System.out.println(target);
    if (target != null) {
      Projectile shot = new Rocket(target, coords[0], coords[1]); 
      setTimer(80);
      return true;
    }
    return false;
  }
  
  public Ship findNearest(double x, double y) {
    double lowestDistance = 100000;
    int index = -1;
    for (int a = 0; a < s.size(); a ++) {
      double[] coords = s.get(a).getCoords();
      double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
      if (distance < lowestDistance && distance < getRange()) {
        lowestDistance = distance;
        index = a;
        //System.out.println("TARGET ACQUIRED");
      }
    }
    if (index == -1) return null;
    return s.get(index);
  }
}

//Force Field Generator, creates seperate item force field
class ForceFieldGen extends Defense {
  
  public ForceFieldGen(double inX, double inY) {
    super(inX, inY);
    for (int x = -2; x < 3; x ++) {
      for (int y = -2; y < 3; y ++) {
        if ( (int) inY / 72 + y < board.length && (int) inX / 72 + x < board[0].length) {
          board[((int) inY / 72) + y][((int) inX / 72) + x].increaseSlow(0.125);
        }
      }
    }
  }

  public boolean attack() {
    return true;
    //Doesn't need to attack anything
  }
}

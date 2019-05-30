abstract class Projectile {
  public Ship target;
  private double x;
  private double y;
  private int damage;
  private double speed;
  
  public Projectile(double inX, double inY) {
    x = inX;
    y = inY;
    p.add(this);
  }
  
  public void move() {
    double[] targetCoords = target.getCoords();
    double changeX = targetCoords[0] - x;
    double changeY = targetCoords[1] - y;
    double angle = Java.lang.Math.
  }

  public int getdamage() {
    return damage;
  }
  
  public double getspeed() {
    return speed;
  }
  public double getX() {
    return x;
  }
  public double getY() {
    return y;
  }
  
  public boolean checkExplode() {
    double[] coords = target.getCoords();
    double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
    if (distance < 5) {
      return true;
    }
    return false; 
  }
}


//CannonBall
class CannonBall extends Projectile {
  private int damage;
  public boolean alive = true;
  
  public CannonBall(Ship inputTarget, double inX, double inY) {
    super(inX, inY);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
  }
  public void death(Ship s) {
    ;
  }
}


//Laser
class Laser extends Projectile {
  public Laser(Ship inputTarget, double inX, double inY) {
    super(inX, inY);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
  }
  
}


//Rocket
class Rocket extends Projectile {
  public Rocket(Ship inputTarget, double inX, double inY) {
    super(inX, inY);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
  }
}

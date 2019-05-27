abstract class Projectile {
  public Ship target;
  private double x;
  private double y;
  private int damage;
  private double speed;
  
  public Projectile(double inX, double inY) {
    x = inX;
    y = inY;
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
  
  public boolean checkExploded() {
    double[] coords = target.getCoords();
    double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
    return true; //Dummy
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

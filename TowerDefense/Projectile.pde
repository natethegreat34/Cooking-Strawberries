abstract class Projectile {
  public Ship target;
  private double x;
  private double y;
  private int damage;
  private double speed;

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
  public int getdamage() {
    return damage;
  }
  
  public boolean checkExploded() {
    double[] coords = target.getCoords();
    double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
  }
}


//CannonBall
class CannonBall extends Projectile {
  private int damage;
  public boolean alive = true;
  
  public CannonBall(Ship inputTarget, double inX, double inY) {
    x = inX;
    y = inY;
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
  
}


//Rocket
class Rocket extends Projectile {
  private int x;
  private int y;
}

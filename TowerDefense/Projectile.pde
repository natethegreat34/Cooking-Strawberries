abstract class Projectile {
  public Ship target;
  private int damage;
  private double speed;

  public int getdamage() {
    return damage;
  }
  public double getspeed() {
    return speed;
  }
}


//CannonBall
<<<<<<< HEAD
class CannonBall extends Projectiles {
  private double x;
  private double y;
=======
class CannonBall extends Projectile {
  private int x;
  private int y;
>>>>>>> 6e6d143c68bab622bffa30224610150023dc147a
  private int damage;
  public boolean alive = true;
  
  public CannonBall(Ship inputTarget, double inX, double inY) {
    x = inX;
    y = inY;
    target = inputTarget();
    double[] targetCoords = target.getCoords();
    
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

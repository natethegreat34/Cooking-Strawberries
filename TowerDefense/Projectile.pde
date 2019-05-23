abstract class Projectile {
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
class CannonBall extends Projectiles {
  private int x;
  private int y;
  private int damage;
  public boolean alive = true;
  public int getX() {
    return x;
  }
  public int getY() {
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
class Laser extends Projectiles {
  
}


//Rocket
class Rocket extends Projectiles {
  private int x;
  private int y;
}

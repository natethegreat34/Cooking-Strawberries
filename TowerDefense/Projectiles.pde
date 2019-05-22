abstract class Projectiles {
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
  PImage cball;
  cball = loadImage("cannonBall.png");
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
  public void cdisplay() {
    image (cball, x, y);
  }
  public void death(Ships s) {
    ;
  }
}


//Laser
class Laser extends Projectiles {
  public void ldisplay() {
    line (x, y, a, b);
  }
}


//Rocket

class Rocket extends Projectiles {
  private int x;
  private int y;
  public void rdisplay() {
    image (rocket, x, y);
  }
}

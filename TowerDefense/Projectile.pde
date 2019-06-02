abstract class Projectile {
  public Ship target;
  private double x;
  private double y;
  private int damage;
  private double speed;
  
  public Projectile(double inX, double inY, int inDamage) {
    x = inX;
    y = inY;
    damage = inDamage;
    speed = 5;
    p.add(this);
  }
  
  public void move() {
    if (target == null) {
      p.remove(this);
    }
    else if (checkExplode()) {
      target.lowerHealth(damage);
      p.remove(this);
    }
    else {
      double[] targetCoords = target.getCoords();
      double changeX = targetCoords[0] - x;
      double changeY = targetCoords[1] - y;
      double angle = Math.atan(changeY / changeX);
      System.out.println(angle);
      if (changeX < 0 && changeY > 0) angle += (PI / 2);
      if (changeX < 0 && changeY < 0) angle += (PI);
      x += speed * Math.cos(angle);
      y += speed * Math.sin(angle);
    }

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
  public CannonBall(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 20);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
  }
}


//Laser
class Laser extends Projectile {
  public Laser(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 10);
    target = inputTarget;
    if (target != null) {
      double[] targetCoords = target.getCoords();
      p.add(this);
    }
  }
  
}


//Rocket
class Rocket extends Projectile {
  public Rocket(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 50);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
  }
}

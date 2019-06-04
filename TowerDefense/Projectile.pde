abstract class Projectile {
  public Ship target;
  private double x;
  private double y;
  private int damage;
  private double speed;
  private double [] tC;
  private double originalX;
  private double originalY;
  private double originalTargetX;
  private double originalTargetY;

  public Projectile(double inX, double inY, int inDamage, int inSpeed) {
    x = inX;
    y = inY;
    originalX = inX;
    originalY = inY;
    damage = inDamage;
    speed = inSpeed;
    p.add(this);
  }
  public double[] gtC() {
    return tC;
  }
  public void move() {
    if (target == null) {
      p.remove(this);
    } else if (checkExplode()) {
      target.lowerHealth(damage);
      p.remove(this);
      MOney += 10;
    } else {
      double[] targetCoords = target.getCoords();
      double changeX = targetCoords[0] - x;
      double changeY = targetCoords[1] - y;
      double angle = Math.atan(changeY / changeX);
      //System.out.println(angle);
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
  public void setX(double in) {
    x = in;
  }
  public void setY(double in) {
    y = in;
  }
  public double getOriginalX() {
    return originalX;
  }
  public double getOriginalY() {
    return originalY;
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
  private double angle;
  private double Xchange;
  private double Ychange;

  public CannonBall(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 20, 10);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
    Xchange = targetCoords[0] - inX;
    Ychange = targetCoords[1] - inY;
    angle = Math.atan(Ychange / Xchange);
    if (Xchange < 0 && Ychange > 0) angle += (PI);
    if (Xchange < 0 && Ychange < 0) angle += (PI);
  }

  public boolean checkExplode() {
    double[] coords = target.getCoords();
    double distance = Math.sqrt(Math.pow((getX() - coords[0]), 2) + Math.pow((getY() - coords[1]), 2));
    if (distance < 25) {
      return true;
    }
    return false;
  }

  public void move() {
    if (target == null) {
      p.remove(this);
    } else if (checkExplode()) {
      target.lowerHealth(getdamage());
      p.remove(this);
      MOney += 1;
    } else {
      //setX(getX() + (Xchange / getspeed()));
      //setY(getY() + (Ychange / getspeed()));
      setX(getX() + getspeed() * Math.cos(angle));
      setY(getY() + getspeed() * Math.sin(angle));
    }
  }
}


//Laser
class Laser extends Projectile {
  private double angle;
  private double Xchange;
  private double Ychange;

  public Laser(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 10, 25);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
    Xchange = targetCoords[0] - (inX + 36);
    Ychange = targetCoords[1] - (inY + 36);
    angle = Math.atan(Ychange / Xchange);
    if (Xchange < 0 && Ychange > 0) angle += (PI);
    if (Xchange < 0 && Ychange < 0) angle += (PI);
  }

  public void move() {
    findOtherTarget();
    if (getX() > 1152 || getX() < 0 || getY() > 800 || getY() < 0) {
      p.remove(this);
    } else if (checkExplode()) {
      target.lowerHealth(getdamage());
      MOney += 1;
    }
    
    //setX(getX() + (Xchange / getspeed()));
    //setY(getY() + (Ychange / getspeed()));
    setX(getX() + getspeed() * Math.cos(angle));
    setY(getY() + getspeed() * Math.sin(angle));
  }
  
  public void findOtherTarget() {
    for (int x = 0; x < s.size(); x ++) {
      double[] coords = s.get(x).getCoords();
      double distance = Math.sqrt(Math.pow((getX() - coords[0]), 2) + Math.pow((getY() - coords[1]), 2));
      if (distance < 25) {
        s.get(x).lowerHealth(getdamage());
        MOney += 1;
      }
    }
  }
  
}


//Rocket
class Rocket extends Projectile {
  public Rocket(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 50, 5);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    p.add(this);
  }
}

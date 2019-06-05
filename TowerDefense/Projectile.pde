abstract class Projectile {
  public Ship target;
  private double x;
  private double y;
  private int damage;
  private double speed;
  private double [] tC; //Not implemented yet
  private double originalX; //Used only in laser
  private double originalY; //Used only in laser
  private double originalTargetX; //Used only in laser
  private double originalTargetY; //Used only in laser

  //Generic constructor for projectiles, sets up private variables
  public Projectile(double inX, double inY, int inDamage, int inSpeed) {
    x = inX;
    y = inY;
    originalX = inX;
    originalY = inY;
    damage = inDamage;
    speed = inSpeed;
    p.add(this); //Adds the projectile to the maseter list, allowing it to be displayed
  }
  
  //Not implemented yet
  public double[] gtC() {
    return tC;
  }
  
  //Placeholder for the individual, distinct movements of the projectiles
  abstract void move();

  //Accessor method for damage
  public int getdamage() {
    return damage;
  }

  //Accessor method for speed
  public double getspeed() {
    return speed;
  }
  
  //Accessor method for the x value of the projectile
  public double getX() {
    return x;
  }
  
  //Accessor method for the y value of the projectile
  public double getY() {
    return y;
  }
  
  //Setter method for the x value of the projectile
  public void setX(double in) {
    x = in;
  }
  
  //Setter method for the y value of the projectile
  public void setY(double in) {
    y = in;
  }
  
  //Only used in laser, returns the original x value before movement
  public double getOriginalX() {
    return originalX;
  }
  
  //Only used in laser, returns the original y value before movement
  public double getOriginalY() {
    return originalY;
  }

  //Checks whether or not a projectile is close enough to damage its target, returns true if so
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

  //Constructor for cannonballs, finds the angle between  itself and the target based on the x and y differences
  public CannonBall(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 50, 10);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    Xchange = targetCoords[0] - inX;
    Ychange = targetCoords[1] - inY;
    angle = Math.atan(Ychange / Xchange);
    //Special cases that arctan doesn't account for
    if (Xchange < 0 && Ychange == 0) angle = PI;
    if (Xchange < 0 && Ychange > 0) angle += (PI);
    if (Xchange < 0 && Ychange < 0) angle += (PI);
  }

  //Cannonball-specific method for checking whether it should damage the  target or not
  public boolean checkExplode() {
    double[] coords = target.getCoords();
    double distance = Math.sqrt(Math.pow((getX() - coords[0]), 2) + Math.pow((getY() - coords[1]), 2));
    if (distance < 25) {
      return true;
    }
    return false;
  }

  //Cannonball-specific
  public void move() {
    if (target == null) {
      p.remove(this);
    } else if (checkExplode()) {
      target.lowerHealth(getdamage());
      p.remove(this);
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
    super(inX, inY, 25, 25);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
    Xchange = targetCoords[0] - (inX + 36);
    Ychange = targetCoords[1] - (inY + 36);
    angle = Math.atan(Ychange / Xchange);
    if (Xchange < 0 && Ychange == 0) angle = PI;
    if (Xchange < 0 && Ychange > 0) angle += (PI);
    if (Xchange < 0 && Ychange < 0) angle += (PI);
    //System.out.println("XChange:" + Xchange + " YChange:" + Ychange + "Angle:" + angle + "\n");
  }

  public void move() {
    findOtherTarget();
    if (getX() > 1152 || getX() < 0 || getY() > 800 || getY() < 0) {
      p.remove(this);
    } else if (checkExplode()) {
      target.lowerHealth(getdamage());
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
      }
    }
  }
  
}


//Rocket
class Rocket extends Projectile {
  public Rocket(Ship inputTarget, double inX, double inY) {
    super(inX, inY, 100, 5);
    target = inputTarget;
    double[] targetCoords = target.getCoords();
  }
  
  public void move() {
    if (target == null) {
      p.remove(this);
    } else if (checkExplode()) {
      target.lowerHealth(getdamage());
      p.remove(this);
    } else {
      double[] targetCoords = target.getCoords();
      double changeX = targetCoords[0] - getX();
      double changeY = targetCoords[1] - getY();
      double angle = Math.atan(changeY / changeX);
      //System.out.println(angle);
      if (changeX < 0 && changeY > 0) angle += (PI / 2);
      if (changeX < 0 && changeY < 0) angle += (PI);
      setX(getspeed() * Math.cos(angle));
      setY(getspeed() * Math.sin(angle));
    }
  }
}

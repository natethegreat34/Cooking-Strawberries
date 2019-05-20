abstract class Projectiles {
  private int damage;
  private double speed;
  
}
PImage img;
img = loadImage("rocket-146104_640.png");
class CannonBall extends Projectiles {
  public void cdisplay(){
    circle(x,y, 50);
  }
}

class Laser extends Projectiles {
   public void ldisplay(){
    line (x,y, a,b);
  }
}

class Rocket extends Projectiles {
   public void cdisplay(){
    circle(x,y, 50);
  }
}

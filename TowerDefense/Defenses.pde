abstract class Defenses {
  private int range;
  private int level;
  public boolean attack(){
    return true;
  }
  
  private boolean shoot(Ships target) {
    
  }
  
  abstract boolean upgrade();
  
  public boolean setLevel(int inputLevel) {
    level = inputLevel;
    return true;
  }
  
  public int getLevel() {
    return level;
  }
  
  public boolean setRange(int inputRange) {
    range = inputRange;
    return true;
  }
}

class Cannon extends Defenses {
  public Cannon()  {
    
  }
}

class LaserShooter extends Defenses {
  
}

class RockerLauncher extends Defenses {
  
}

class ForceFieldGen extends Defenses {
  
}

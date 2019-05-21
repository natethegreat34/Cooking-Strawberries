abstract class Defenses {
  private int range;
  private int level;
 
  abstract boolean attack();
  
  public Ships findNearest(int x, int y) {
    
  }
  
  public boolean upgrade() {
    level += 1;
    return true;
  }
  
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
    setRange(-1000000000);
    setLevel(1);
  }
  
  public boolean attack() {
    return true;
  } 
}

class LaserShooter extends Defenses {
  
}

class RockerLauncher extends Defenses {
  
}

class ForceFieldGen extends Defenses {
  
}

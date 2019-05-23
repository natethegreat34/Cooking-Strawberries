//abstract class Defense {
//  private int range;
//  private int level;

//  abstract boolean attack();

//  public Ship findNearest(int x, int y) {
//  }

//  public boolean upgrade() {
//    level += 1;
//    return true;
//  }

//  public boolean setLevel(int inputLevel) {
//    level = inputLevel;
//    return true;
//  }

//  public int getLevel() {
//    return level;
//  }

//  public boolean setRange(int inputRange) {
//    range = inputRange;
//    return true;
//  }
//}

////Cannon
//class Cannon extends Defense {
//  public Cannon() {
//    setRange(-1000000000);
//    setLevel(1);
//  }

//  public boolean attack() {
//    return true;
//  }
//}

////Laser Shooter
//class LaserShooter extends Defense {
//}

////Rocket Launcher
//class RockerLauncher extends Defense {
//}

////Force Field Generator, creates seperate item force field
//class ForceFieldGen extends Defense {
//}

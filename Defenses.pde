//abstract class Defense {
//  private double x;
//  private double y;
//  private int range;
//  private int level;

//  abstract boolean attack();

//  public Ship findNearest(int x, int y) {
//    double lowestDistance = 100000;
//    int index = -1;
//    for (int a = 0; a < TowerDefense.ships.length; a ++) {
//      double[] coords = ships[a].getCoords();
//      double distance = Math.sqrt(Math.pow((x - coords[0]), 2) + Math.pow((y - coords[1]), 2));
//      if (distance < lowestDistance) {
//        lowestDistance = distance;
//        index = a;
//      }
//    }
//    return ships[index];
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
//  public boolean attack() {
//    return true;
//  }
//}

////Rocket Launcher
//class RockerLauncher extends Defense {
//  public boolean attack() {
//    return true;
//  }
//}

////Force Field Generator, creates seperate item force field
//class ForceFieldGen extends Defense {
//}

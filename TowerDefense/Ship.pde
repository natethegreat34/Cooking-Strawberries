class Ship {
  private double x;
  private double y;
  private double speed;
  private int health;
  private int damage;
  private Tile nextTile;
  private int pathIndex;
  private int direction; //0, 1, or 2 (N, E, or S)
  
  
  public double[] getCoords() {
    double[] output = new double[2];
    output[0] = x;
    output[1] = y;
    return output;
  }
  
  public void move() {
    if (x >= nextTile.getleft() + 18 && y >= nextTile.gettop() + 18) {
      x = nextTile.getleft() + 18;
      y = nextTile.gettop() + 18;
      findNextTile(); //Checking if at/past center, then sets the next target
    }
    if (direction == 0) y -= speed;
    if (direction == 1) x += speed;
    if (direction == 2) y += speed;
  }
  
  //When the ship reaches the center of a tile, it finds the next tile and then figures out which direction it needs to go (i.e. north, west, etc.) it travels till it reaches this tile's center and then repeats the process
  
  private void findNextTile() {
    pathIndex += 1;
    nextTile = path.get(pathIndex);
    Tile old = path.get(pathIndex - 1);
    if (old.getleft() == nextTile.getleft() && old.gettop() > nextTile.gettop()) direction = 0; 
    if (old.gettop() == nextTile.gettop()) direction = 1;
    if (old.getleft() == nextTile.getleft() && old.gettop() < nextTile.gettop()) direction = 2; 
  }
}

class Normal extends Ship {
}
class Quick extends Ship {
}
class Heavy extends Ship {
}
class Boss extends Ship {
}

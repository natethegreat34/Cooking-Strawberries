class Ship {
  private double x;
  private double y;
  private double speed;
  private int health;
  public int damage;
  private Tile nextTile;
  private int pathIndex;
  public int direction; //0, 1, or 2 (N, E, or S)
  
  public Ship() {
    pathIndex = 0;
    nextTile = path.get(0);
    direction = 1;
    x = nextTile.getleft();
    y = nextTile.gettop() + 18;
  }
  
  public double[] getCoords() {
    double[] output = new double[2];
    output[0] = x;
    output[1] = y;
    return output;
  }
  
  public void move() {
    double adjustedSpeed = speed;
    Tile current = board[(int) x / 36][(int) y / 36];
    if (current.checkSlow()) adjustedSpeed = speed * (1 - current.getSlow());
    if (health <= 0) {
      s.remove(this);
    }
    if (x >= nextTile.getleft() + 18 && ((y >= nextTile.gettop() + 18 && direction != 0) || (y <= nextTile.gettop() + 18 && direction == 0))) {
      x = nextTile.getleft() + 18;
      y = nextTile.gettop() + 18;
      findNextTile(); //Checking if at/past center, then sets the next target
    }
    if (direction == 0) y -= adjustedSpeed;
    if (direction == 1) x += adjustedSpeed;
    if (direction == 2) y += adjustedSpeed;
  }
  
  //When the ship reaches the center of a tile, it finds the next tile and then figures out which direction it needs to go (i.e. north, west, etc.) it travels till it reaches this tile's center and then repeats the process
  
  private void findNextTile() {
    pathIndex += 1;
    if (pathIndex == path.size()) {
      s.remove(this);
      castleHealth -= damage;
    }
    else {
      nextTile = path.get(pathIndex);
      Tile old = path.get(pathIndex - 1);
      if (old.getleft() == nextTile.getleft() && old.gettop() > nextTile.gettop()) direction = 0; 
      if (old.gettop() == nextTile.gettop()) direction = 1;
      if (old.getleft() == nextTile.getleft() && old.gettop() < nextTile.gettop()) direction = 2; 
    }
  }
  
  public void setSpeed(double inputSpeed) {
    speed = inputSpeed;
  }
  
  public void lowerHealth(int damage) {
    health -= damage;
  }
  
  public void setHealth(int inputHealth) {
    health = inputHealth;
  }
}

class Normal extends Ship {
  public Normal() {
    super();
    setSpeed(1);
    setHealth(100);
    damage = 5;
  }
}
class Quick extends Ship {
  public Quick() {
    super();
    setSpeed(6);
    setHealth(50);
  }
}
class Heavy extends Ship {
  public Heavy() {
    super();
    setSpeed(1);
    setHealth(2002);
  }
}
class Boss extends Ship {
}

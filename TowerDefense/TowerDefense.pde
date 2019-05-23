ArrayList <Tile> path = new ArrayList();
PImage grass;
PImage dirt;
PImage cball;
PImage rocket;
PImage img;
int f;
boolean ended;
ArrayList <Ship> s = new ArrayList();
void setup() {
  size(576, 400);
  rocket = loadImage("rocket-146104_640.png");
  cball = loadImage("cannonBall.png");
  grass = loadImage("grass14.png");
  dirt = loadImage("Seamless ground sand texture (4).jpg");
  img = loadImage("BFjwi.png");
  f = (int)(Math.random() * 9) * 36;
  //tilemaker(0, f);
}
void remaker() {
  for (int i = 0; i< width; i = i +36) {
    for (int y = 0; y< 324; y = y +36) {
      grass.resize(36, 36);
      image(grass, i, y);
      fill(0, 100);
      stroke(0);
      rect(i, y, 36, 36);
      //Tile constructor here to set boolean and top, bottom, left and right
    }
  }
  dirt.resize(36, 36);
  image(dirt, 0, f);
  fill(0, 100);
  stroke(255);
  rect(0, f, 36, 36);
  Tile a = new Tile (0, f, 36, f + 36, false);
  path.add(a);
  for (int i = 1; i < path.size(); i ++) {
    int x = path.get(i).getleft();
    int y = path.get(i).gettop();
    dirt.resize(36, 36);
    image(dirt, x, y);
    fill(0, 100);
    stroke(255);
    rect(x, y, 36, 36);
  }
}
void tilemaker(int x, int y) {
  boolean done = false;
  while (!done) {
    if (x >= width - 36) {
      done = true;
    }
    int l = (int) Math.random() *3;
    if (l == 0 && y < 324) {
      y = y + 36;
      Tile a = new Tile (x, y, y + 36, x + 36, false);
      path.add(a);
    }
    if (l == 1 && y > 0) {
      y = y - 36;
      Tile a = new Tile (x, y, y + 36, x + 36, false);
      path.add(a);
    } 
     if (l == 2){
      x = x + 36;
      Tile a = new Tile (x, y, y + 36, x + 36, false);
      path.add(a);
    }
  }
}
void draw() {
  //image(img, 0, 0);
  remaker();
  rect(0, 324, 5760, 76);
  text("Y-Cord:" + mouseY, 10, 60);
}

PImage grass;
PImage dirt;
PImage cball;
PImage rocket;
PImage img;
int f;
boolean ended;
void setup() {
  size(576, 400);
  rocket = loadImage("rocket-146104_640.png");
  cball = loadImage("cannonBall.png");
  grass = loadImage("grass14.png");
  dirt = loadImage("Seamless ground sand texture (4).jpg");
  img = loadImage("BFjwi.png");
  f = (int)(Math.random() * 9) * 36;
}
void remaker() {
  for (int i = 0; i< width; i = i +36) {
    for (int y = 0; y< 324; y = y +36) {
      grass.resize(36, 36);
      image(grass, i, y);
      fill(0, 100);
      stroke(0);
      rect(i, y, 36, 36);
      new Tile (y,i,i + 36, y + 36, true);
      //Tile constructor here to set boolean and top, bottom, left and right
    }
  }
  dirt.resize(36, 36);
  image(dirt, 0, f);
  fill(0, 100);
  stroke(255);
  rect(0, f, 36, 36);
  new Tile (0,f,36, f + 36, false);
}
void tilemaker(int x, int y) {
  color a = get(x, y + 36);
  color b = get(x, y - 36);
  color c = get(x + 36, y);
  if (x == width){
    ended = true;
  }
  while (!ended) {
    int l = (int) Math.random() *3;
    if (l == 0 && y < height && a ) {
      dirt.resize(36, 36);
      image(dirt, x, y);
      fill(0, 100);
      stroke(255);
      rect(x, y + 36, 36, 36);
      tilemaker(x, y + 36);
    }
    if (l == 1 && y > 0) {
      dirt.resize(36, 36);
      image(dirt, x, y);
      fill(0, 100);
      stroke(255);
      rect(x, y - 36, 36, 36);
      tilemaker(x, y - 36);
    }
    if (l == 2  && x < width) {
      dirt.resize(36, 36);
      image(dirt, x, y);
      fill(0, 100);
      stroke(255);
      rect(x + 36, y, 36, 36);
      tilemaker(x + 36, y);
    }
  }
}
  void draw() {
    //image(img, 0, 0);
    remaker();
    rect(0, 324, 5760, 76);
    text(mouseY, 10, 60);
  }

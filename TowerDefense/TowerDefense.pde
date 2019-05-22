class Game {
  int[][] shipCoordinates;
  int [] ships;    
}
  PImage img;
  void setup() {
  size(600, 400);
  img = loadImage("BFjwi.png");
}


void draw() {
  image(img, 0, 0);
  rect(mouseX, mouseY, 36,36);
  rect(0,324,600,76);
  text(mouseY,10,60);
}

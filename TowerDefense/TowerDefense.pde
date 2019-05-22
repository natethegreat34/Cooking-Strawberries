class Game {
  int[][] shipCoordinates;
  int [] ships;    
}
  PImage img;
  void setup() {
    
  size(width, height);
  img = loadImage("BFjwi.png");
}


void draw() {
  image(img, 0, 0);
}

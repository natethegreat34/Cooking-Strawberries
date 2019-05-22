PImage grass;


PImage cball;


PImage rocket;


  PImage img;
  void setup() {
  size(576, 400);
  rocket = loadImage("rocket-146104_640.png");
  cball = loadImage("cannonBall.png");
  grass = loadImage("grass14.png");
  img = loadImage("BFjwi.png");
}
 void remaker(){
   for(int i = 0; i< width; i = i +36){
     for(int y = 0; y< 324; y = y +36){
       grass.resize(36,36);
       image(grass,i,y);
       fill(0,100);
       rect(i,y,36,36);
     }
   }
 }

void draw() {
  image(img, 0, 0);
  remaker();
  rect(0,324,5760,76);
  text(mouseY,10,60);
}

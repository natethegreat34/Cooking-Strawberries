ArrayList <Tile> path = new ArrayList();
PImage grass;
PImage dirt;
PImage cball;
PImage rocket;
PImage img;
int f;
boolean ended;
Tile[][] board = new Tile[9][16];
ArrayList <Ship> s = new ArrayList();
ArrayList<Projectile> p = new ArrayList();

void setup() {
  size(576, 400);
  rocket = loadImage("rocket-146104_640.png");
  cball = loadImage("cannonBall.png");
  grass = loadImage("grass14.png");
  dirt = loadImage("Seamless ground sand texture (4).jpg");
  img = loadImage("BFjwi.png");
  f = (int)(Math.random()  * 9);

  remaker();
  tilemaker(f, 0);

}
void remaker() {
  for (int i = 0; i<= 288; i = i +36) {
    for (int y = 0; y<= 540; y = y +36) {
      grass.resize(36, 36);
      image(grass, y, i);
      fill(0, 100);
      stroke(0);
      rect(y, i, 36, 36);
      board[i / 36][y / 36] = new Tile(i, y, y + 36, i + 36, true);
      //Tile constructor here to set boolean and top, bottom, left and right
    }
  }
  dirt.resize(36, 36);
  image(dirt, 0, f*36);
  fill(0, 100);
  stroke(255);
  rect(0, f*36, 36, 36);
  Tile a = new Tile (f*36,0, 36, f*36 + 36, false);
  board[f][0] = a;
  print (f + "cdbbdsjfbhdsjhb");
  path.add(a);
}
void tilemaker(int row, int col) {
  boolean done = false;
  while (!done) {
    int l = (int) (Math.random() * 3);
    if (col >= 15) {
      done = true;
    } else if (l == 0 && row > 0 && row < board.length && board[row - 1][col].getColor()) {
      row = row - 1;
      //print("slide up");
      board[row][col].setcolor(false);
      path.add( board[row][col]);
    } else if (l == 1 && row >= 0 && row + 1 < board.length && board[row + 1][col].getColor()) {
      row = row + 1;
      //print("slide down");
      board[row][col].setcolor(false);
      path.add( board[row][col]);
    } else if (l == 2 && col >= 0 && col + 1 < board[row].length && board[row][col + 1].getColor()) {
      col = col + 1;
      //print("slide to the right");
      board[row][col].setcolor(false);
      path.add(board[row][col]);
    }
  }
}
void draw() {
  //image(img, 0, 0);
    dirt.resize(36, 36);
  fill(0, 100);
  stroke(255);
  for (int i = 0; i < 9; i ++) { 
    for (int y = 0; y < 16; y ++) {
      print(i + "   mm " + y + "||||");
      if (board[i][y].getColor() == false) {
        image(dirt, y * 36, i*36);
        rect(y * 36, i*36, 36, 36);
      }
    }
  }
  rect(0, 324, 575, 74);
  text("Y-Cord:" + mouseY, 10, 60);
}

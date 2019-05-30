ArrayList <Tile> path = new ArrayList();
PImage grass;
PImage dirt;
PImage cball;
PImage rocket;
PImage img;
PImage enemy;
PImage k;
PImage v;
int f;
int counter;
boolean ended;
Tile[][] board = new Tile[9][16];
ArrayList <Ship> s = new ArrayList();
ArrayList<Projectile> p = new ArrayList();
int castleHealth;

void setup() {
  size(576, 400);
  castleHealth = 100;
  rocket = loadImage("rocket-146104_640.png");
  cball = loadImage("cannonBall.png");
  grass = loadImage("grass14.png");
  dirt = loadImage("Seamless ground sand texture (4).jpg");
  img = loadImage("BFjwi.png");
  enemy= loadImage("roundysh.png");
  k = loadImage("Right.png");
  v = loadImage("Down.png");
  f = (int)(Math.random()  * 7 + 1);

  remaker();
  tilemaker(f, 0);
  enemy.resize(24, 24);
  k.resize(24,24);
  v.resize(24,24);
//rotate(PI/2.0);
  //image (enemy,6, f * 36 + 6);
  Ship q = new Normal();
  s.add(q);

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
  Tile a = new Tile (f*36, 0, 36, f*36 + 36, false);
  board[f][0] = a;
  //print (f + "cdbbdsjfbhdsjhb");
  path.add(a);
}
void tilemaker(int row, int col) {
  boolean done = false;
  while (!done) {
    int l = (int) (Math.random() * 3);
    if (col >= 15) {
      done = true;
    } else if (l == 0 && row > 1 && row < board.length - 1 && board[row - 1][col].getColor()) {
      row = row - 1;
      //print("slide up");
      if (col > 0 && (board[row][col-1].getColor() || board[row + 1][col].getColor() || board[row + 1][col-1].getColor()) && (board[row][col+1].getColor() || board[row + 1][col].getColor() || board[row + 1][col+1].getColor())) {
        board[row][col].setcolor(false);
        path.add( board[row][col]);
      } else {
        row = row + 1;
      }
    } else if (l == 1 && row >= 1 && row + 1 < board.length - 1 && board[row + 1][col].getColor()) {
      row = row + 1;
      //print("slide down");
      if (col > 0 && (board[row][col-1].getColor() || board[row - 1][col].getColor() || board[row - 1][col-1].getColor()) && (board[row][col+1].getColor() || board[row - 1][col].getColor() || board[row - 1][col+1].getColor())) {

        board[row][col].setcolor(false);
        path.add( board[row][col]);
      } else {
        row = row - 1;
      }
    } else if (l == 2 && col >= 0 && col + 1 < board[row].length && board[row][col + 1].getColor()) {
      col = col + 1;
      //print("slide to the right");
      board[row][col].setcolor(false);
      path.add(board[row][col]);
    }
  }
}
void draw() {
  counter ++;
  //image(img, 0, 0);
  dirt.resize(36, 36);
  fill(0, 100);
  stroke(255);
  for (int i = 0; i < 9; i ++) { 
    for (int y = 0; y < 16; y ++) {
      //print(i + "   mm " + y + "||||");
      if (board[i][y].getColor() == false) {
        image(dirt, y * 36, i*36);
        rect(y * 36, i*36, 36, 36);
      }
    }
  }
  if (counter % 36 == 0){
    Ship k = new Normal();
    s.add(k);
  }
for (int x = 0; x < s.size(); x++){
  s.get(x).move();
  if (s.get(x).direction == 0){
   image (enemy, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
}
  if (s.get(x).direction == 1){
   image (k, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
}
  if (s.get(x).direction == 2){
   image (v, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
}
}

  rect(0, 324, 575, 74);
  fill(255);
  text("Health:" + castleHealth, 10, 345);
}

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
  tilemaker(0, f);
}
void remaker() {
  for (int i = 0; i< width; i = i +36) {
    for (int y = 0; y< 324; y = y +36) {
      grass.resize(36, 36);
      image(grass, i, y);
      fill(0, 100);
      stroke(0);
      rect(i, y, 36, 36);
      board[y / 36][i / 36] = new Tile(y, i, i + 36, y + 36, true);
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
  //for (int i = 1; i < path.size(); i ++) {
  //  int x = path.get(i).getleft();
  //  int y = path.get(i).gettop();
  //  dirt.resize(36, 36);
  //  image(dirt, x, y);
  //  fill(0, 100);
  //  stroke(255);
  //  rect(x, y, 36, 36);
  //}
}
void tilemaker(int row, int col) {
  boolean done = false;
  while (!done) {
    int l = (int) (Math.random() * 3);
        print (row);
    if (col >= 16) {
      done = true;
    }

    else if (l == 0 && row >= 0 && row < board.length && board[row - 1][col].getColor()) {
      row = row - 1;
      board[row][col].setcolor(false);
      path.add( board[row][col]);
    }
    else if (l == 1 && row >= 0 && row + 1 < board.length && board[row + 1][col].getColor()) {
      row = row + 1;
      board[row][col].setcolor(false);
      path.add( board[row][col]);
    } 
    else if (l == 2 && col >= 0 && col + 1 < board[0].length && board[row][col + 1].getColor()){
      col = col + 1;
      board[row][col].setcolor(false);
      path.add(board[row][col]);
    }
  }
}
void draw() {
  //image(img, 0, 0);
  remaker();
  rect(0, 324, 575, 74);
  text("Y-Cord:" + mouseY, 10, 60);
}

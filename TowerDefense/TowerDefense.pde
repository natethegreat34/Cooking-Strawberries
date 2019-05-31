
import java.util.*;
Tile[][] board = new Tile[9][16];

ArrayList <Tile> path = new ArrayList();
ArrayList <Ship> s = new ArrayList();
ArrayList<Projectile> p = new ArrayList();
ArrayList <Defense> t = new ArrayList();
PImage grass;
PImage dirt;
PImage img;
PImage enemy;
PImage k;
PImage v;
PImage end;
PImage roc;
PImage las;
PImage can;
//Projectiles
PImage cannonBall;
PImage laser;
PImage rocket;
int f;
int mx;
int my;
int counter;
int castleHealth;
int MOney;
int type;
boolean holdup;
boolean place;
boolean ended;
Defense l;
boolean press;

void setup() {
  size(1152, 800);
  
  //starting amounts
  castleHealth = 100;
  MOney = 150;
  f = (int)(Math.random()  * 7 + 1);
  
  //load images
  rocket = loadImage("rocket-146104_640.png");
  cannonBall = loadImage("cannonBall.png");
  grass = loadImage("grass14.png");
  dirt = loadImage("Seamless ground sand texture (4).jpg");
  img = loadImage("BFjwi.png");
  enemy= loadImage("roundysh.png");
  k = loadImage("Right.png");
  v = loadImage("Down.png");
  end = loadImage("gallery_9873_7_17106.png");
  roc = loadImage("rocketShooter.png");
  las = loadImage("laserShooter.png");
  can = loadImage("cannon.png");
  
  //resizing
  enemy.resize(48, 48);
  k.resize(48, 48);
  v.resize(48, 48);
  roc.resize (72, 72);
  las.resize(72, 72);
  can.resize(72, 72);
  grass.resize(72, 72);
  dirt.resize(72, 72);
  
  //setting up methods
  remaker();
  tilemaker(f, 0);

  //for testing
  Ship q = new Normal();
  s.add(q);
}
void remaker() {
  for (int i = 0; i<= 288 *2; i = i +72) {
    for (int y = 0; y<= 540 *2; y = y +72) {
      image(grass, y, i);
      fill(0, 100);
      stroke(0);
      rect(y, i, 72, 72);
      board[i / 72][y / 72] = new Tile(i, y, y + 72, i + 72, true);
    }
  }
  image(dirt, 0, f*72);
  fill(0, 100);
  stroke(255);
  rect(0, f*72, 72, 72);
  Tile a = new Tile (f*72, 0, 72, f*72 + 72, false);
  board[f][0] = a;
  board[f][0].placer(false);
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
      if (col > 0 && (board[row][col-1].getColor() || board[row + 1][col].getColor() || board[row + 1][col-1].getColor()) && (board[row][col+1].getColor() || board[row + 1][col].getColor() || board[row + 1][col+1].getColor())) {
        board[row][col].setcolor(false);
        board[row][col].placer(false);
        path.add( board[row][col]);
      } else {
        row = row + 1;
      }
    } else if (l == 1 && row >= 1 && row + 1 < board.length - 1 && board[row + 1][col].getColor()) {
      row = row + 1;
      if (col > 0 && (board[row][col-1].getColor() || board[row - 1][col].getColor() || board[row - 1][col-1].getColor()) && (board[row][col+1].getColor() || board[row - 1][col].getColor() || board[row - 1][col+1].getColor())) {

        board[row][col].setcolor(false);
        board[row][col].placer(false);
        path.add( board[row][col]);
      } else {
        row = row - 1;
      }
    } else if (l == 2 && col >= 0 && col + 1 < board[row].length && board[row][col + 1].getColor()) {
      col = col + 1;
      board[row][col].setcolor(false);
      board[row][col].placer(false);
      path.add(board[row][col]);
    }
  }
}
void draw() {
  if (castleHealth > 0 ) {
    for (int e = 0; e < 9; e ++) { 
      for (int y = 0; y < 16; y ++) {
        if (board[e][y].getColor() == false) {
          fill(0, 100);
          stroke(255);
          image(dirt, y * 72, e*72);
          rect(y * 72, e*72, 72, 72);
        } else {
          fill(0, 100);
          stroke(0);
          image(grass, y * 72, e *72);
          rect(y * 72, e*72, 72, 72);
        }
      }
      for (int i = 0; i < t.size(); i ++) {
        if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 0) {
          image(roc, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
        if (board [(int) t.get(i).getCoords()[1]/72] [(int) t.get(i).getCoords()[0]/72].type == 1) {
          image(las, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
        if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 2) {
          image(can, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
      }
    }
    for (int x = 0; x < s.size(); x++) {
      if (s.get(x).direction == 0) {
        image (enemy, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
      }
      if (s.get(x).direction == 1) {
        image (k, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
      }
      if (s.get(x).direction == 2) {
        image (v, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
      }
    }
    rect(0, 324 * 2, 575 * 2, 74 * 2);
    fill(255, 0, 0);
    
    //rocket
    rect(144 * 2, 324 * 2, 144 * 2, 74 * 2);
    fill(0, 255, 0);
    
    //laser
    rect(288 * 2, 324 * 2, 144 * 2, 74 * 2);
    fill(0, 0, 255);
    
    //cannon
    rect(432 * 2, 324 * 2, 144 * 2, 74 * 2);
    fill(255);
    
    text("Health:" + castleHealth, 10 * 2, 345  * 2);
    text("Money ($):" + MOney, 10 * 2, 375  * 2);
    fill(0);
    text("Rocket Launcher ($50):", 150 * 2, 345 * 2);
    text("Laser Shooter ($10):", 300  * 2, 345 * 2);
    text("Cannon ($20):", 454  * 2, 345 * 2);
    for (int i = 0; i < t.size(); i ++) {
      if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 0) {
        image(roc, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
      }
      if (board [(int) t.get(i).getCoords()[1]/72] [(int) t.get(i).getCoords()[0]/72].type == 1) {
        image(las, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
      }
      if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 2) {
        image(can, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
      }
    }
    if (holdup == false) {
      counter ++;
      dirt.resize(72, 72);

      for (int i = 0; i < 9; i ++) { 
        for (int y = 0; y < 16; y ++) {
          if (board[i][y].getColor() == false) {
            fill(0, 100);
            stroke(255);
            image(dirt, y * 72, i*72);
            rect(y * 72, i*72, 72, 72);
          } else {
            fill(0, 100);
            stroke(0);
            image(grass, y * 72, i * 72);
            rect(y * 72, i* 72, 72, 72);
          }
        }
      }
      for (int i = 0; i < t.size(); i ++) {
        if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 0) {
          image(roc, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
        if (board [(int) t.get(i).getCoords()[1]/72] [(int) t.get(i).getCoords()[0]/72].type == 1) {
          image(las, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
        if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 2) {
          image(can, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
      }
      if (counter % 72 == 0) {
        Ship k = new Normal();
        s.add(k);
      }
      for (int x = 0; x < s.size(); x++) {
        s.get(x).move();
        if (s.get(x).direction == 0) {
          image (enemy, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
        }
        if (s.get(x).direction == 1) {
          image (k, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
        }
        if (s.get(x).direction == 2) {
          image (v, (float) (s.get(x).getCoords()[0]- 10), (float) (s.get(x).getCoords()[1] - 10) );
        }
      }
    }

    if (holdup) {
      if (type == 0) {
        image(roc, mouseX - 18, mouseY - 18);
      }
      if (type == 1) {
        image(las, mouseX - 18, mouseY - 18);
      }
      if (type == 2) {
        image(can, mouseX - 18, mouseY - 18);
      }
    }
    if (castleHealth <= 0) {
      noLoop();
      end.resize(width, height);
      image(end, 0, 0);
    }
  }
}

void mousePressed() {
  //rocket     rect(144, 324, 144, 74);
  if (mouseX > 144 * 2 && mouseX < 288 * 2 && mouseY > 324 * 2 && MOney >= 50) {
    press = true;
    holdup = true;
    type = 0;
  }
  // laser:     rect(288, 324, 144, 74);
  if (mouseX > 288 * 2 && mouseX < 432 * 2 && mouseY > 324 * 2 && MOney >= 10) {
    press = true;
    holdup = true;
    type = 1;
  }
  //cannon     rect(432, 324, 144, 74);
  if (mouseX > 432 && mouseX < 576 * 2 && mouseY > 324 * 2 && MOney >= 20) {
    press = true;
    holdup = true;
    type = 2;
  }
}
void mouseReleased() {

  if (press && mouseX > 0 && mouseX < 576* 2 && mouseY < 324 * 2 && MOney >= 10) {
    int y = mouseY/72;
    int x = mouseX/72;
    if (board[y] [x].op()) {        
      holdup = false;
      if (type == 0) {
        MOney -= 50;
        l = new LaserShooter ((double) (x * 72 ), (double) (y * 72 ));
        board[y] [x].typer(0);
      }
      if (type == 1) {
        MOney -= 10;
        l = new LaserShooter ((double) (x * 72 ), (double) (y * 72 ));
        board[y] [x].typer(1);
      }
      if (type == 2) {
        MOney -= 20;
        l = new Cannon ((double) (x * 72 ), (double) (y * 72));
        board[y] [x].typer(2);
      }
      board[y] [x].placer(false);
      press = false;
      t.add(l);
    }
  }
}

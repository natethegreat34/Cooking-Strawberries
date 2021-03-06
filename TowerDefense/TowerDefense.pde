import java.util.*;
Tile[][] board = new Tile[9][16];
ArrayList <Tile> path = new ArrayList();
ArrayList <Ship> s = new ArrayList();
ArrayList<Projectile> p = new ArrayList();
ArrayList <Defense> t = new ArrayList();
ArrayList<Ship> queue = new ArrayList();
//loading screen
PImage loading;
//Game Over and winning screen 
PImage end;
PImage anewstart;
// displays range
PImage whitecircle;
// tile colors
PImage grass;
PImage dirt;
//normal ship (^,>,v)
PImage enemy;
PImage k;
PImage v;
//quick ship (^,>,v)
PImage qup;
PImage qright;
PImage qdown;
//heavy ship (^,>,v)
PImage hup;
PImage hright;
PImage hdown;
//boss ship (^,>,v)'
PImage bup;
PImage bright;
PImage bdown;
// Defense 
PImage roc;
PImage las;
PImage can;
// For the X box
PImage x;
//Projectiles
PImage cannonBall;
PImage laser;
PImage rocket;
PImage forc;
// current level
int level;
int hleft;
// randomly selected number for random path
int f;
int counter;
int castleHealth;
int MOney;
// type of defense
int type;
// is the game paused
boolean holdup;
boolean place;
boolean ended;
Defense l;
boolean press;
boolean demo;

void setup() {
  size(1152, 800);

  //starting amounts
  castleHealth = 100;
  MOney = 100;
  f = (int)(Math.random()  * 7 + 1);

  //load images
  rocket = loadImage("rocket-146104_640.png");
  cannonBall = loadImage("cannonBall.png");
  whitecircle = loadImage("WC.png");
  grass = loadImage("grass14.png");
  dirt = loadImage("Seamless ground sand texture (4).jpg");
  enemy= loadImage("roundysh.png");
  k = loadImage("Right.png");
  v = loadImage("Down.png");
  qup = loadImage("quick^.png");
  qright = loadImage("quick>.png");
  qdown = loadImage("quickv.png");
  hup = loadImage("heavy^.png");
  hright = loadImage("heavy>.png");
  hdown = loadImage("heavyv.png");
  bup = loadImage("boss^.png");
  bright = loadImage("boss>.png");
  bdown = loadImage("bossv.png");
  end = loadImage("gallery_9873_7_17106.png");
  roc = loadImage("rocketShooter.png");
  las = loadImage("laserShooter.png");
  can = loadImage("cannon.png");
  forc = loadImage("ForceField.png");
  x = loadImage("X.png");
  loading = loadImage("morthal_swamp_03_by_baba64-d5qptgt.jpg");
  anewstart = loadImage("A-Winner-is-You.jpg");
  laser = loadImage("laser.png");
  rocket = loadImage("rocket-146104_640.png");

  //resizing
  whitecircle.resize(int(100 * PI), int(100 * PI));
  enemy.resize(48, 48);
  qup.resize(48, 48);
  qright.resize(48, 48);
  qdown.resize(48, 48);
  hup.resize(48, 48);
  hright.resize(48, 48);
  hdown.resize(48, 48);
  bup.resize(72, 72);
  bright.resize(72, 72);
  bdown.resize(72, 72);
  k.resize(48, 48);
  v.resize(48, 48);
  roc.resize (72, 72);
  las.resize(72, 72);
  can.resize(72, 72);
  forc.resize(72, 72);
  grass.resize(72, 72);
  dirt.resize(72, 72);
  x.resize(72, 77 * 2);
  cannonBall.resize(30, 30);
  laser.resize(10, 30);
  rocket.resize(20, 40);

  //setting up methods
  remaker();
  tilemaker(f, 0);
  level = 1;

  //loading screen
  anewstart.resize(width, height);
  loading.resize(width, height);
  image(loading, 0, 0);
} 

//sets up board modeled after a 2d-array of Tiles
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

//randomly generates a path for enemy ships to follow
void tilemaker(int row, int col) {
  boolean done = false;
  while (!done) {
    int l = (int) (Math.random() * 3);
    //if the edge of the board is reached, stop
    if (col >= 15) {
      done = true;
    } 
    //if l is 0, the path will turn up, if there is room
    else if (l == 0 && row > 1 && row < board.length - 1 && board[row - 1][col].getColor()) {
      row = row - 1;
      if (col > 0 && (board[row][col-1].getColor() || board[row + 1][col].getColor() || board[row + 1][col-1].getColor()) && (board[row][col+1].getColor() || board[row + 1][col].getColor() || board[row + 1][col+1].getColor())) {
        board[row][col].setcolor(false);
        board[row][col].placer(false);
        path.add(board[row][col]);
      } else {
        row = row + 1;
      }
      //if l is 1, the path will turn down, if there is room
    } else if (l == 1 && row >= 1 && row + 1 < board.length - 1 && board[row + 1][col].getColor()) {
      row = row + 1;
      if (col > 0 && (board[row][col-1].getColor() || board[row - 1][col].getColor() || board[row - 1][col-1].getColor()) && (board[row][col+1].getColor() || board[row - 1][col].getColor() || board[row - 1][col+1].getColor())) {

        board[row][col].setcolor(false);
        board[row][col].placer(false);
        path.add( board[row][col]);
      } else {
        row = row - 1;
      }
    }//if l is 2, the path will go right 
    else if (l == 2 && col >= 0 && col + 1 < board[row].length && board[row][col + 1].getColor()) {
      col = col + 1;
      board[row][col].setcolor(false);
      board[row][col].placer(false);
      path.add(board[row][col]);
    }
  }
}

//puts everything in motion
void draw() {
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      demo = true;
      level = -1;
      MOney = 10000;
      castleHealth = 1000;
    }
  }
  //if the castle is still alive
  if (castleHealth > 0 ) {
    //if there are no more ships to spawn for the level and all the ships have died
    if (s.size() == 0 && queue.size() == 0 && (level > 10 || (demo && level == 0))) {
      image(anewstart, 0, 0);
      //noLoop();
    } else {
      //re draws the board
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
        // re draws the defenses onto the board
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
          if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 3) {
            image(forc, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
          }
        }
      }

      //draws the enemy ships based on their type and direction, also centers them
      for (int x = 0; x < s.size(); x++) {
        if (s.get(x) instanceof Normal) {
          if (s.get(x).direction == 0) {
            image (enemy, (float) (s.get(x).getCoords()[0] - 24), (float) (s.get(x).getCoords()[1]) - 24);
          }
          if (s.get(x).direction == 1) {
            image (k, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1])- 24 );
          }
          if (s.get(x).direction == 2) {
            image (v, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1]) - 24);
          }
        }
        if (s.get(x) instanceof Quick) {
          if (s.get(x).direction == 0) {
            image (qup, (float) (s.get(x).getCoords()[0] - 24), (float) (s.get(x).getCoords()[1]) - 24);
          }
          if (s.get(x).direction == 1) {
            image (qright, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1])- 24 );
          }
          if (s.get(x).direction == 2) {
            image (qdown, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1]) - 24);
          }
        }
        if (s.get(x) instanceof Heavy) {
          if (s.get(x).direction == 0) {
            image (hup, (float) (s.get(x).getCoords()[0] - 24), (float) (s.get(x).getCoords()[1]) - 24);
          }
          if (s.get(x).direction == 1) {
            image (hright, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1])- 24 );
          }
          if (s.get(x).direction == 2) {
            image (hdown, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1]) - 24);
          }
        }
        if (s.get(x) instanceof Boss) {
          if (s.get(x).direction == 0) {
            image (bup, (float) (s.get(x).getCoords()[0] - 36), (float) (s.get(x).getCoords()[1]) - 36);
          }
          if (s.get(x).direction == 1) {
            image (bright, (float) (s.get(x).getCoords()[0]- 36), (float) (s.get(x).getCoords()[1])- 36);
          }
          if (s.get(x).direction == 2) {
            image (bdown, (float) (s.get(x).getCoords()[0]- 36), (float) (s.get(x).getCoords()[1]) - 36);
          }
        }
      }

      // draws the boxes that appear at the bottom of the screen

      // box for money, health, and level
      rect(0, 324 * 2, 576 * 2, 77 * 2);
      fill(255, 0, 0);

      //rocket
      rect(144 * 2 - 72, 324 * 2, 72 * 3, 77 * 2);
      fill(255, 255, 0);

      //laser
      rect(288 * 2 - 144, 324 * 2, 72 * 3, 77 * 2);
      fill(0, 255, 255);

      //cannon
      rect(432 * 2 - 72 * 3, 324 * 2, 72 * 3, 77 * 2);
      fill(255);

      //forcefield
      rect(576 * 2 - 72 * 4, 324 * 2, 72 * 3, 77 * 2);
      fill(0, 0, 255);

      // X
      image(x, 72 * 15, 324 * 2);
      text("Health:" + castleHealth, 10 * 2, 345  * 2);
      text("Level:" + (level - 1), 10 * 2, 360 * 2);
      text("Money ($):" + MOney, 10 * 2, 375  * 2);
      fill(0);
      text("Rocket Launcher ($50):", 150 * 2 - 72, 345 * 2);
      text("Laser Shooter ($10):", 300  * 2 - 144, 345 * 2);
      text("Cannon ($20):", 454  * 2 - 72 * 3, 345 * 2);
      text("Force Field ($20):", 605  * 2 - 72 * 4, 345 * 2);
      //don't really need, but makes sure nothing goes over the defenses
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
        if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 3) {           
          image(forc, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
        }
      }

      //if the game isn't paused
      if (holdup == false) {
        counter ++;
        dirt.resize(72, 72);
        // redraw the board
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
        //redraw the defences
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
          if (board [(int)t.get(i).getCoords()[1]/72] [(int)t.get(i).getCoords()[0]/72].type == 3) {   
            image(forc, (float) t.get(i).getCoords()[0], (float) t.get(i).getCoords()[1]);
          }
        }

        //Generating the ships
        if (queue.size() == 0 && counter % 144 == 0 && s.size() == 0) {
          genQueue(level);
          level ++;
          MOney += 10;
        } else if (counter % 36 == 0 && queue.size() != 0) {
          s.add(queue.remove(0));
        }

        // redraw the ships after they move
        for (int x = 0; x < s.size(); x++) {
          s.get(x).move();
          if (x == s.size());
          else if (s.get(x) instanceof Normal) {
            if (s.get(x).direction == 0) {
              image (enemy, (float) (s.get(x).getCoords()[0] - 24), (float) (s.get(x).getCoords()[1]) - 24);
            }
            if (s.get(x).direction == 1) {
              image (k, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1])- 24 );
            }
            if (s.get(x).direction == 2) {
              image (v, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1]) - 24);
            }
          } else if (s.get(x) instanceof Quick) {
            if (s.get(x).direction == 0) {
              image (qup, (float) (s.get(x).getCoords()[0] - 24), (float) (s.get(x).getCoords()[1]) - 24);
            }
            if (s.get(x).direction == 1) {
              image (qright, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1])- 24 );
            }
            if (s.get(x).direction == 2) {
              image (qdown, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1]) - 24);
            }
          } else if (s.get(x) instanceof Heavy) {
            if (s.get(x).direction == 0) {
              image (hup, (float) (s.get(x).getCoords()[0] - 24), (float) (s.get(x).getCoords()[1]) - 24);
            }
            if (s.get(x).direction == 1) {
              image (hright, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1])- 24 );
            }
            if (s.get(x).direction == 2) {
              image (hdown, (float) (s.get(x).getCoords()[0]- 24), (float) (s.get(x).getCoords()[1]) - 24);
            }
          } else if (s.get(x) instanceof Boss) {
            if (s.get(x).direction == 0) {
              image (bup, (float) (s.get(x).getCoords()[0] - 36), (float) (s.get(x).getCoords()[1]) - 36);
            }
            if (s.get(x).direction == 1) {
              image (bright, (float) (s.get(x).getCoords()[0]- 36), (float) (s.get(x).getCoords()[1])- 36);
            }
            if (s.get(x).direction == 2) {
              image (bdown, (float) (s.get(x).getCoords()[0]- 36), (float) (s.get(x).getCoords()[1]) - 36);
            }
          }
        }

        //Has all defenses attack
        for (int x = 0; x < t.size(); x ++) {
          t.get(x).attack();
        }
        //Calls projectiles into existence
        for (int x = 0; x < p.size(); x ++) {
          if (p.get(x) instanceof CannonBall) {
            image(cannonBall, (float) p.get(x).getX() - 15, (float) p.get(x).getY() - 15);
          }

          if (p.get(x) instanceof Laser) {
            stroke (0, 255, 0);
            line((float) p.get(x).getOriginalX() + 36, (float) p.get(x).getOriginalY() + 36, (float) p.get(x).getX(), (float) p.get(x).getY());
          }

          if (p.get(x) instanceof Rocket) {
            image(rocket, (float) p.get(x).getX(), (float) p.get(x).getY());
          }
        }

        //Makes projectiles move
        for (int x = 0; x < p.size(); x ++) {
          p.get(x).move();
        }
      }

      //if game is paused
      if (holdup) {
        //makes the circle white or red to show range and where a defense can be placed
        fill(255);
        tint(255, 100);
        if (mouseY/72 < board.length && mouseX/72 < board [0].length) {
          if (board [mouseY/72] [mouseX/72].op() == false) { 
            tint (255, 0, 0, 100);
          }
        }
        // range differs based on defense
        if (type == 0) {
          whitecircle.resize(250, 250);    
          image(whitecircle, mouseX - 125, mouseY - 125);
          noTint();
          image(roc, mouseX - 36, mouseY - 36);
        }
        if (type == 1) {
          whitecircle.resize(360, 360);    
          image(whitecircle, mouseX - 180, mouseY - 180);
          noTint();
          image(las, mouseX - 36, mouseY - 36);
        }
        if (type == 2) {
          whitecircle.resize(504, 504);    
          image(whitecircle, mouseX - 252, mouseY - 252);
          noTint();
          image(can, mouseX - 36, mouseY - 36);
        }
        if (type == 3) {
          whitecircle.resize(216, 216);    
          image(whitecircle, mouseX - 108, mouseY - 108);
          noTint();
          image(forc, mouseX - 36, mouseY - 36);
        }
      }

      //if the castle dies
      if (castleHealth <= 0) {
        noLoop();
        end.resize(width, height);
        image(end, 0, 0);
      }
    }
  }
}

void mousePressed() {
  //when the player wants to buy a defense

  //rocket's box: rect(144 * 2 - 72, 324 * 2, 72 * 3, 74 * 2);
  if (mouseX > 72 * 3 && mouseX < 72 * 6 && mouseY > 324 * 2 && MOney >= 50) {
    press = true;
    holdup = true;
    type = 0;
  }
  // laser's box: rect(288 * 2 - 144, 324 * 2, 72 * 3, 74 * 2);
  if (mouseX > 72 * 6 && mouseX < 72 * 9 && mouseY > 324 * 2 && MOney >= 10) {
    press = true;
    holdup = true;
    type = 1;
  }
  //cannon's box: rect(432 * 2 - 72 * 3, 324 * 2, 72 * 3, 74 * 2);
  if (mouseX > 72 * 9 && mouseX < 72 * 12 && mouseY > 324 * 2 && MOney >= 20) {
    press = true;
    holdup = true;
    type = 2;
  }
  //forcefield's box: rect(576 * 2 - 72 * 4, 324 * 2, 72 * 3, 74 * 2);
  if (mouseX > 72 * 12 && mouseX < 72 * 15 && mouseY > 324 * 2 && MOney >= 20) {
    press = true;
    holdup = true;
    type = 3;
  }
  // X's box: (x, 72 * 15, 324 * 2);
  if (mouseX > 72 * 15 && mouseX < 72 * 16 && mouseY > 324 * 2) { 
    press = false;
    holdup = false;
  }
}
void mouseReleased() {
  //when the player decides on the tile to place the defense

  if (press && mouseX > 0 && mouseX < 576* 2 && mouseY < 324 * 2 && MOney >= 10) {
    int y = mouseY/72;
    int x = mouseX/72;
    if (board[y] [x].op()) {        
      holdup = false;
      if (type == 0) {
        MOney -= 50;
        l = new RocketLauncher ((double) (x * 72 ), (double) (y * 72 ));
        board[y] [x].typer(0);
        board[y] [x].placer(false);
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
      if (type == 3) {
        MOney -= 20;
        l = new ForceFieldGen ((double) (x * 72 ), (double) (y * 72));
        board[y] [x].typer(3);
      }
      //the tile is now not open
      board[y] [x].placer(false);
      press = false;
      t.add(l);
    }
  }
}

void genQueue(int inLevel) {
  //gets the ships ready to be called into the level 
  if (queue.size() != 0) System.out.println("MAJOR ERROR");
  else {
    ArrayList<Integer> numbers = Levels.getNumbers(inLevel);
    ArrayList<Integer> types = Levels.getTypes(inLevel);

    for (int x = 0; x < numbers.size(); x ++) {
      for (int y = 0; y < numbers.get(x); y ++) {
        if (types.get(x) == 0) {
          Ship queuedShip = new Normal();
          queue.add(queuedShip);
        }
        if (types.get(x) == 1) {
          Ship queuedShip = new Quick();
          queue.add(queuedShip);
        }
        if (types.get(x) == 2) {
          Ship queuedShip = new Heavy();
          queue.add(queuedShip);
        }
        if (types.get(x) == 3) {
          Ship queuedShip = new Boss();
          queue.add(queuedShip);
        }
      }
    }
  }
}

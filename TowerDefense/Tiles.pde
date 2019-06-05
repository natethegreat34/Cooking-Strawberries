class Tile{
  private int top; //Y value for the top of the tile
  private int left; //X value for the left of the tile
  private int right; //X value for the right of the tile
  private int bottom; //Y value for the bottom of the tile
  private boolean green; //Whether the tile is grass or path
  public boolean open = true; //Checks whether a defense can be placed here
  public int type; //Not implemented
  private double slowDown; //slows down the ships by said percentage

  //Generic constructor
  public Tile (int t, int l, int r, int b, boolean g){
    top = t;
    left = l;
    right = r;
    bottom = b;
    green = g;
    slowDown = 0;
  }
  
  //Setter method for top
  public void settop(int y){
    top = y;
  }
  
  //Setter method for left
  public void setleft(int x){
    left = x;
  }
  
  //Setter method for right
  public void setright(int x){
    right = x;
  }
  
  //Setter method for bottom
  public void setbottom(int y){
    bottom = y;
  }
  
  //Color setter method
  public void setcolor(boolean k){
    green = k;
  }
  
  //Setter method for open, used after a tile is taken up by a defense
  public void placer(boolean t){
    open = t;
  }
  
  //Not implemented
    public void typer(int y){
    type = y;
  }
  
  //Accessor method for open, used for checking when placing
  public boolean op(){
    return open;
  }
  
  //Accessor method for top
  public int gettop(){
    return top;
  }
  
  //Accessor method for left
  public int getleft(){
    return left;
  }
  
  //Accessor method for right
  public int getright(){
    return right;
  }
  
  //Accessor method for bottom
  public int getbottom(){
    return bottom;
  }
  
  //Accessor method for type of tile
  public boolean getColor(){
    return green;
  }
  
  //Used by force fields, increases the percentage that ships are slowed by
  public void increaseSlow(double slow) {
    slowDown += slow;
  }
  
  //Returns whether or not a ship should be slowed down on top of it
  public boolean checkSlow() {
    return slowDown != 0;
  }
  
  //Returns the slow percentage
  public double getSlow() {
    return slowDown;
  }
}

class Tile{
  private int top;
  private int left;
  private int right;
  private int bottom;
  private boolean green;
  public Tile (int t, int l, int r, int b, boolean g){
    top = t;
    left = l;
    right = r;
    bottom = b;
    green = g;
  }
  public void settop(int y){
    top = y;
  }
  public void setleft(int x){
    left = x;
  }
  public void setright(int x){
    right = x;
  }
  public void setbottom(int y){
    bottom = y;
  }
  public void setcolor(boolean k){
    green = k;
  }
  
    public int gettop(){
    return top;
  }
    public int getleft(){
    return left;
  }
    public int getright(){
    return right;
  }
    public int getbottom(){
    return bottom;
  }
  public boolean getcolor(){
    return green;
  }
}
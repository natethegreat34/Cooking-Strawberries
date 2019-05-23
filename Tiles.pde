class Tile{
  int top;
  int left;
  int right;
  int bottom;
  boolean green;
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
}

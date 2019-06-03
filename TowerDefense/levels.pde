class Levels {
  public ArrayList<Integer> getNumbers(int level) {
    ArrayList<Integer> output = new ArrayList<Integer>();
    if (level == 1) {
      output.add(5);
      output.add(-1);
    }
    if (level == 2) {
      output.add(15);
      output.add(-1);
    }
    if (level == 3) {
      output.add(5);
      output.add(1);
      output.add(5);
      output.add(-1);
    }
    if (level == 4) {
      output.add(10);
      output.add(-1);
    }
    if (level == 5) {
      output.add(10);
      output.add(-1);
    }
    if (level == 6) {
      output.add(10);
      output.add(1);
      output.add(10);
      output.add(2);
      output.add(-1);
    }
    if (level == 7) {
      output.add(10);
      output.add(-1);
    }
    if (level == 8) {
      output.add(10);
      output.add(10);
      output.add(10);
      output.add(-1);
    }
    if (level == 9) {
      output.add(15);
      output.add(15);
      output.add(5);
      output.add(15);
      output.add(15);
      output.add(5);
      output.add(-1);
    }
    if (level == 10) {
      output.add(20);
      output.add(20);
      output.add(20);
      output.add(1);
    }
    return output;
  }
  
  public ArrayList<Integer> getTypes(int level) {
    ArrayList<Integer> output = new ArrayList<Integer>();
    if (level == 1) {
      output.add(0);
      output.add(-1);
    }
    if (level == 2) {
      output.add(0);
      output.add(-1);
    }
    if (level == 3) {
      output.add(0);
      output.add(1);
      output.add(0);
      output.add(-1);
    }
    if (level == 4) {
      output.add(0);
      output.add(1);
      output.add(-1);
    }
    if (level == 5) {
      output.add(0);
      output.add(1);
      output.add(0);
      output.add(1);
      output.add(-1);
    }
    if (level == 6) {
      output.add(0);
      output.add(2);
      output.add(1);
      output.add(2);
      output.add(-1);
    }
    if (level == 7) {
      output.add(2);
      output.add(-1);
    }
    if (level == 8) {
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(-1);
    }
    if (level == 9) {
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(-1);
    }
    if (level == 10) {
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(3);
    }
    return output;
  }
}

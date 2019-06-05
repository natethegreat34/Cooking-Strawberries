//These two methods store everything we need for the levels, dictating what ships should be spawned and when
static class Levels {
  //Returns a list of numbers, specifying the amount of ships that should be spawned each level
  public static ArrayList<Integer> getNumbers(int level) {
    ArrayList<Integer> output = new ArrayList<Integer>();
    if (level == 1) {
      output.add(5);
 
    }
    if (level == 2) {
      output.add(15);
    }
    if (level == 3) {
      output.add(5);
      output.add(1);
      output.add(5);

    }
    if (level == 4) {
      output.add(10);
      output.add(10);

    }
    if (level == 5) {
      output.add(10);
      output.add(10);
      output.add(10);
      output.add(10);

    }
    if (level == 6) {
      output.add(10);
      output.add(1);
      output.add(10);
      output.add(2);

    }
    if (level == 7) {
      output.add(10);

    }
    if (level == 8) {
      output.add(10);
      output.add(10);
      output.add(10);

    }
    if (level == 9) {
      output.add(15);
      output.add(15);
      output.add(5);
      output.add(15);
      output.add(15);
      output.add(5);
 
    }
    if (level == 10) {
      output.add(20);
      output.add(20);
      output.add(20);
      output.add(1);
    }
    if (level == -1) {
      output.add(5);
      output.add(5);
      output.add(5);
      output.add(5);
    }
    return output;
  }
  
  //Returns a list of types, corresponding with the numbers to represent which types of ships should be spawned
  public static ArrayList<Integer> getTypes(int level) {
    ArrayList<Integer> output = new ArrayList<Integer>();
    if (level == 1) {
      output.add(0);

    }
    if (level == 2) {
      output.add(0);

    }
    if (level == 3) {
      output.add(0);
      output.add(1);
      output.add(0);

    }
    if (level == 4) {
      output.add(0);
      output.add(1);

    }
    if (level == 5) {
      output.add(0);
      output.add(1);
      output.add(0);
      output.add(1);

    }
    if (level == 6) {
      output.add(0);
      output.add(2);
      output.add(1);
      output.add(2);
 
    }
    if (level == 7) {
      output.add(2);

    }
    if (level == 8) {
      output.add(0);
      output.add(1);
      output.add(2);

    }
    if (level == 9) {
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(0);
      output.add(1);
      output.add(2);

    }
    if (level == 10) {
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(3);
    }
    if (level == -1) {
      output.add(0);
      output.add(1);
      output.add(2);
      output.add(3);
    }
    return output;
  }
}

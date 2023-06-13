import g4p_controls.*;

BoxList list;

void setup() {
  int[] arr = {1, 4, 5, 7, 9, 10};
  println(binarySearch(arr, 0, arr.length-1, 9));
  println(linearSearch(arr, 9));
  list = new BoxList(5);
  
  size(750, 400);
  rectMode(CENTER);
  createGUI();
}

void draw() {
  background(175);
  textAlign(CENTER, CENTER);
  
  fill(255);
  textSize(16);
  text("Searching Algorithm Visualizer", 135, 25); // Title
  
  textSize(18);
  text("Searching Algorithm goes here", 375, 100);
}

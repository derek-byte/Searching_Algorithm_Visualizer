import g4p_controls.*;

BoxList list;
boolean isAnimating;

int n = 15;
int[] inputList = new int[n];
String sortingAlgo;

void setup() {
  isAnimating = false;
  sortingAlgo = "Linear Search";
  list = new BoxList(n);
  
  println(binarySearch(list.arr, 0, list.arr.length-1, list.searchValue));
  println(linearSearch(list.arr, 9));
  
  size(750, 400);
  rectMode(CENTER);
  createGUI();
}

void draw() {
  background(125);
  textAlign(CENTER, CENTER);
  
  fill(255);
  textSize(16);
  text("Searching Algorithm Visualizer", 135, 25); // Title
  
  textSize(18);
  text(sortingAlgo, 375, 100);
  
  list.drawLegend();
  list.displayBoxes();
  list.drawPointer();
}

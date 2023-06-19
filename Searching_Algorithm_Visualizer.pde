import g4p_controls.*;

BoxList list;
boolean isAnimating;

int n = 15;
int[] inputList = new int[n];
String sortingAlgo;

int frameRate = 2;
int i=0; 

void setup() {
  isAnimating = false;
  sortingAlgo = "Linear Search";
  list = new BoxList(n);
    
  size(750, 400);
  rectMode(CENTER);
  createGUI();
  
  frameRate(2);
  //noLoop();
}

void draw() {
  noStroke();
  background(125);
  textAlign(CENTER, CENTER);
  
  fill(255);
  textSize(16);
  text("Searching Algorithm Visualizer", 135, 25); // Title
  
  fill(100);
  rect(375, 90, 300, 70);
  
  textSize(18);
  fill(255);
  text(sortingAlgo, 375, 80);
  textSize(12);
  text("Search Value:", 375, 100);
  
  list.drawLegend();
  if (isAnimating && sortingAlgo.equals("Linear Search") && i< list.arr.length) {
    //println(binarySearch(list.arr, 0, list.arr.length-1, list.searchValue));
    //println(linearSearch(list.arr, 9));
    if (list.arr[i] == list.searchValue) {
      isAnimating = false;
      //return i;
    }
    i++;
    println("HI", i);
  }
  
  if (i != 0)
    list.drawPointer(i-1);
  else
    list.drawPointer(i);
  //list.animateLinearSearch(list.arr, 9);
  list.displayBoxes();
  //list.drawPointer();
  
  fill(100);
  rect(375, 300, 750, 2);
  
  textSize(13);
  fill(255);
  text("Total Comparisions:", 375, 335);
  text("Index Found:", 375, 360);
  
  fill(100);
  rect(715, 365, 35, 35);
  rect(665, 365, 35, 35);
  fill(255);
  text("?", 715, 362);
  text("</>", 665, 362);
}

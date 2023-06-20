import g4p_controls.*;

BoxList list;
boolean isAnimating;

int n = 15;
int[] inputList = new int[n];
String sortingAlgo;

int frameRate = 2;
int i=0; 
int totalComparisons;
int indexFound;

boolean isWindowIncreased = false;
String sideDisplay;
int screenIncreaseVal = 200;

void setup() {
  isAnimating = false;
  sortingAlgo = "Linear Search";
  list = new BoxList(n);
  
  totalComparisons = 0;
  //sideDisplay = "";
    
  size(750, 400);
  rectMode(CENTER);
  createGUI();
  
  frameRate(2);
  frame.setResizable(true);
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
  text("Search Value: " + list.searchValue, 375, 100);
  
  list.drawLegend();
  if (isAnimating && sortingAlgo.equals("Linear Search") && i< list.arr.length) {
    //println(binarySearch(list.arr, 0, list.arr.length-1, list.searchValue));
    //println(linearSearch(list.arr, 9));
    if (list.arr[i] == list.searchValue) {
      isAnimating = false;
      indexFound = i;
      button1.setText("Play");
      //return i;
    }
    i++;
    totalComparisons++;
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
  if (isWindowIncreased) {
    rect(750, 200, 2, 400);
    rect(750+screenIncreaseVal/2, 50, screenIncreaseVal, 2);
    textSize(13);
    fill(255);
    if (sideDisplay.equals("code")) {
      text("Code", (2*750+screenIncreaseVal)/2, 25);
    } else if (sideDisplay.equals("help")) {
      text("Help", (2*750+screenIncreaseVal)/2, 25);
    }
  }
  
  textSize(13);
  fill(255);
  text("Total Comparisions: " + totalComparisons, 375, 335);
  text("Index Found: " + indexFound, 375, 360);
  
  fill(100);
  rect(715, 335, 35, 35);
  rect(665, 335, 35, 35);
  rect(690, 380, 85, 35);
  fill(255);
  text("?", 715, 332);
  text("</>", 665, 332);
  text("Video Demo", 690, 378);
}

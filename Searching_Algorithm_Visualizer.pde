import g4p_controls.*;

BoxList list;
boolean isAnimating;

int n = 15;
int[] inputList = new int[n];
String sortingAlgo;

float frameRate = 1;
int i=0; 
int totalComparisons;
int indexFound;

boolean isWindowIncreased = false;
String sideDisplay;
int screenIncreaseVal = 200;

// Binary Search
int maxIndex;
int minIndex;
  
void setup() {
  createGUI();
  
  isAnimating = false;
  sortingAlgo = "Linear Search";
  list = new BoxList(n);
  
  totalComparisons = 0;
  //sideDisplay = "";
    
  size(750, 400);
  rectMode(CENTER);
  
  frameRate(2);
  frame.setResizable(true);
  //noLoop();
  
  maxIndex = list.arr.length;
  minIndex = 0;
}

void draw() {
  noStroke();
  background(125);
  textAlign(CENTER, CENTER);
  
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
  } else if (isAnimating && sortingAlgo.equals("Binary Search") && i < list.arr.length) {
    println("TESTING");
    if (maxIndex >= minIndex) {
      int midIndex = (maxIndex + minIndex) / 2;
      i = midIndex;
      println(minIndex, maxIndex, midIndex);
      if (list.arr[midIndex] == list.searchValue) {
        isAnimating = false;
        indexFound = i;
        button1.setText("Play");
      }
      else if (list.arr[midIndex] < list.searchValue) {
        minIndex = midIndex+1;
      }
      else {
        maxIndex = midIndex-1;
      }
      totalComparisons++;
      println("HI", list.arr[midIndex]);
    }
  } else if (isAnimating && sortingAlgo.equals("Jump Search") && i < list.arr.length) { // Jump Search Fix this when searchValue = 0
    int jumpAmount = int(sqrt(list.arr.length));
    //println(list.arr[i]);
    if (list.arr[i] == list.searchValue) {
      println("HI",list.arr[i]);
      isAnimating = false;
      indexFound = i;
      button1.setText("Play");
    }
    else if (i != 0 && list.arr[i] > list.searchValue) {
      i--;
    } else if (list.arr[i] < list.searchValue) {
      i += jumpAmount;
    }
    
    if (i > list.arr.length-1) {
      i = list.arr.length-1;
    }
   
    totalComparisons++;
  }
  
  list.displayBoxes();
  
  if (i != 0 && sortingAlgo.equals("Linear Search"))
    list.drawPointer(i-1);
  else
    list.drawPointer(i);
    
  //delay(1000);
  createHeaders();
  displayButtonEvents();
  list.drawLegend();
}

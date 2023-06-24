import g4p_controls.*;

BoxList list;
boolean isAnimating;

int n = 15; // Default Array Size
float frameRate = 2;
int screenIncreaseVal = 275; // Sidebar width

// Colours 
color background = color(85);
color boxBackground = color(195);
color lineBackground = color(100);
color buttonBackground = color(100);

String sortingAlgo;
int i;
int totalComparisons;
int indexFound;
String sideDisplay;
boolean isWindowIncreased;

// Binary Search
int maxIndex;
int minIndex;

// Jump Search
int prevStep;
boolean isBackwards;
int jumpAmount;

void setup() {
  createGUI();
  
  isAnimating = false;
  sortingAlgo = "Linear Search";
  list = new BoxList(n);
  
  totalComparisons = 0;
  maxIndex = list.arr.length;
  minIndex = 0;
  prevStep = 0;
  sideDisplay = "";
  indexFound = -1;
  isWindowIncreased = false;
  isBackwards = false;
  i=0;
  jumpAmount = int(sqrt(list.arr.length));
    
  size(750, 400);
  rectMode(CENTER);
  
  frameRate(frameRate);
  frame.setResizable(true);
}

void draw() {
  noStroke();
  background(background);
  textAlign(CENTER, CENTER);
  
  if (isAnimating && sortingAlgo.equals("Linear Search") && i < list.arr.length) { // Linear Search Animation
    if (list.arr[i] == list.searchValue) {
      isAnimating = false;
      indexFound = i;
      button1.setText("Play");
    }
    if (indexFound == -1) {
      totalComparisons++;
      i++;
    }
  } else if (isAnimating && sortingAlgo.equals("Binary Search") && i < list.arr.length) { // Binary Search Animation
    if (maxIndex >= minIndex) {
      int midIndex = (maxIndex + minIndex) / 2;
      i = midIndex;
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
    }
  } else if (isAnimating && sortingAlgo.equals("Jump Search") && i < list.arr.length) {     
    if (list.arr[i] < list.searchValue && !isBackwards) {
      prevStep = i;
      i += jumpAmount;
      if (i > list.arr.length-1) {
        i = list.arr.length-1;
      }
      if (prevStep == i)
        isAnimating = false;
        indexFound = -1;
        button1.setText("Play");
    } else if (i > prevStep) {
      isBackwards = true;
      if (list.arr[i] == list.searchValue) {
        isAnimating = false;
        indexFound = i;
        button1.setText("Play");
      } else {
        i--;
      }
    } else {
      isAnimating = false;
      indexFound = -1;
      button1.setText("Play");
    }
    
    if (indexFound == -1)
      totalComparisons++;
  }
  
  list.displayBoxes();
  list.drawPointer(i);
    
  createHeaders();
  displayButtonEvents();
  list.drawLegend();
}

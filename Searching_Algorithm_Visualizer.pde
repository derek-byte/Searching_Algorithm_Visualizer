import g4p_controls.*;

void setup() {
  int[] arr = {1, 4, 5, 7, 9, 10};
  //println(binarySearch(arr, 3, 9));
  size(600, 400);
  createGUI();
}

void draw() {
  background(175);
  fill(255);
  textSize(16);
  text("Searching Algorithm Visualizer", 15, 25);
}

int binarySearch(int[] arr, int midIndex, int search) {
  if (arr[midIndex] == search) {
    return midIndex;
  }
  else if (arr[midIndex] > search) {
    int[] newArr = subset(arr, 0, midIndex);
    int newMidIndex = (0+midIndex)/2;
    return binarySearch(newArr, newMidIndex, search);
  }
  else {
    int[] newArr = subset(arr, midIndex, arr.length-1);
    int newMidIndex = (arr.length+midIndex)/2;
    return binarySearch(newArr, newMidIndex, search);
  }
}

int linearSearch(int[] arr, int search) {
  for (int i=0; i<arr.length; i++) {
    list.displayBoxes();
    list.drawPointer(i);
    delay(1000);
    if (arr[i] == search) {
      isAnimating = false;
      return i;
    }
    println("HI");
  }
  redraw();
  
  return -1;
}

int binarySearch(int[] arr, int minIndex, int maxIndex, int search) { 
  if (maxIndex >= minIndex) {
    int midIndex = (maxIndex + minIndex) / 2;
    println(minIndex, maxIndex, midIndex);
    if (arr[midIndex] == search) {
      return midIndex;
    }
    else if (arr[midIndex] < search) {
      return binarySearch(arr, midIndex+1, maxIndex, search);
    }
    else {
      return binarySearch(arr, minIndex, midIndex-1, search);
    }
  }
  
  return -1;
}

int [] mergeSort( int[] a, int start, int end ) {
   if (start == end) {
     int[] arr = {a[start]};
     return arr;
   } else {
     int mid = (start + end) /2;
     
     int[] sortedLeftHalf = mergeSort(a, start, mid);
     int[] sortedRightHalf = mergeSort(a, mid+1, end);
     return merge(sortedLeftHalf, sortedRightHalf);
   }
}  

int[] merge( int[] a, int[] b ) {
  int[] c = new int[ a.length+b.length ]; 
  
  int i = 0;  
  int j = 0;   
  int k = 0;  
  
  while (i < a.length && j < b.length) {
    if (a[i] < b[j]) {
      c[k] = a[i];
      i++;
    } else {
      c[k] = b[j];
      j++;
    }
    k++;  
  }
  
  if (i < a.length) {
    while (i < a.length) {
      c[k] = a[i];
      k++;
      i++;
    }
  } else {
    while (j < b.length) {
      c[k] = b[j];
      k++;
      j++;
    }
  }
  
  return c;
}

void createHeaders() {
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
}

void displayButtonEvents() {
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
      text("Information", (2*750+screenIncreaseVal)/2, 25);
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

void resetValues() {
  i = 0;
  minIndex = 0;
  maxIndex = list.arr.length;
  totalComparisons = 0;
  indexFound = -1;
}

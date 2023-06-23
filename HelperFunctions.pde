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

//int jumpSearch() {
//  int jumpAmount = int(sqrt(list.arr.length));
//  if (list.arr[i] == list.searchValue) {
//    return i;
//  }
//  else if (i != 0 && list.arr[i] > list.searchValue) {
//    i--;
//  } else if (list.arr[i] < list.searchValue) {
//    i += jumpAmount;
//  }
  
//  if (i > list.arr.length-1) {
//    i = list.arr.length-1;
//  }
//}

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
    rect(750+screenIncreaseVal/2, 370, screenIncreaseVal, 2);
    
    fill(255);
    textSize(10);
    text("Made by Derek Sheen@2023", 750+screenIncreaseVal/2, 385);
    
    textSize(13);
    if (sideDisplay.equals("code")) {
      text("Code", (2*750+screenIncreaseVal)/2, 25);
      displayCode();
    } else if (sideDisplay.equals("help")) {
      text("Information", (2*750+screenIncreaseVal)/2, 25);
      displayInformation();
    }
  }
  
  textAlign(CENTER, CENTER); 
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

void displayInformation() {
  textAlign(LEFT, CENTER);
  textSize(10);
  if (sortingAlgo.equals("Linear Search")) {
    text("", (2*750+screenIncreaseVal)/2, 75);
  } else if (sortingAlgo.equals("Binary Search")) {
    text("STUFF1", (2*750+screenIncreaseVal)/2, 75);
  } else if (sortingAlgo.equals("Jump Search")) {
    text("STUFF2", (2*750+screenIncreaseVal)/2, 75);
  }
}

void displayCode() {
  textAlign(LEFT, CENTER);
  textSize(10);
  if (sortingAlgo.equals("Linear Search")) {
    text("int linearSearch(int[] arr, int search) {", 760, 75);
    text("for (int i=0; i<arr.length; i++) {", 770, 95);
    text("if (arr[i] == search) {", 780, 115);
    text("return i;", 790, 135);
    text("}", 780, 155);
    text("}", 770, 175);
    text("return -1;", 770, 195);
    text("}", 760, 215);
    //image(linearSearchImg, 750, 75, 200, 180);
  } else if (sortingAlgo.equals("Binary Search")) {
    //int binarySearch(int[] arr, int minIndex, int maxIndex, int search) { 
    //  if (maxIndex >= minIndex) {
    //    int midIndex = (maxIndex + minIndex) / 2;
    //    println(minIndex, maxIndex, midIndex);
    //    if (arr[midIndex] == search) {
    //      return midIndex;
    //    }
    //    else if (arr[midIndex] < search) {
    //      return binarySearch(arr, midIndex+1, maxIndex, search);
    //    }
    //    else {
    //      return binarySearch(arr, minIndex, midIndex-1, search);
    //    }
    //  }
      
    //  return -1;
    //}
    text("int binarySearch(int[] a, int min, int max, int s) { ", 760, 75);
    text("if (max >= min) {", 770, 95);
    text("int mid = (max + min) / 2;", 780, 115);
    
    text("if (a[mid] == s) {", 780, 135);
    text("return mid;", 790, 155);
    
    text("} else if (a[mid] < s) {", 780, 175);
    text("return binarySearch(a, mid+1, max, s);", 790, 195);
    
    text("} else {", 780, 215);
    text("return binarySearch(a, min, mid-1, s);", 790, 235);
    text("}", 780, 255);
    
    text("}", 770, 275);
    text("return -1;", 770, 295);
    text("}", 760, 315);
  } else if (sortingAlgo.equals("Jump Search")) {
    text("STUFF2", (2*750+screenIncreaseVal)/2, 75);
  }
}

void resetValues() {
  i = 0;
  minIndex = 0;
  maxIndex = list.arr.length;
  totalComparisons = 0;
  indexFound = -1;
}

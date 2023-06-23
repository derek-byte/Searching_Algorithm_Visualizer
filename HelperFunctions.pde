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

int jumpSearch(int[] arr, int search) {
  int jumpAmount = int(sqrt(arr.length));
  int i = 0;
  int prev = 0;
  while (arr[i] < search) {
    prev = i;
    i += jumpAmount;
      if (i > arr.length-1) {
      i = arr.length-1;
    }
    if (prev == i)
      return -1;
      
    println(i, prev);
  }
  while (i > prev) {
    println("BYT", i, prev);
    if (arr[i] == search) {
    return i;
  }
    i--;
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
    text("Linear Search (aka Sequential Search)", 760, 75);
    text("- List DOES NOT need to be sorted", 760, 95);
    text("- Iterate through the list until target value is found", 760, 115);
    text("- Simplest searching algorithm", 760, 135);
    text("- O(n)", 760, 155);
  } else if (sortingAlgo.equals("Binary Search")) {
    text("Binary Search", 760, 75);
    text("- List DOES need to be sorted", 760, 95);
    text("- Compare the middle value of the list w/ target value", 760, 115);
    text("- If it is the same, return the value", 770, 135);
    text("- If mid value is smaller, disregard the right half w/ larger values", 770, 155);
    text("  larger values", 770, 175);
    text("- Focus on left half w/ smaller values", 780, 195);
    text("- If mid value is larger, disregard the left half w/", 770, 215);
    text("  smaller values", 770, 235);
    text("- Focus on right half w/ larger values", 780, 255);
    text("- Repeat the process above with the new list half", 760, 275);
    text("- Repeatedly dividing the search interval in half", 760, 295);
    text("- O(log₂n)", 760, 2315);
  } else if (sortingAlgo.equals("Jump Search")) {
    text("Jump Search", 760, 75);
    text("- List DOES NOT need to be sorted", 760, 95);
    text("- Checks fewer elements than linear search", 760, 115);
    text("- Jumping ahead by fixed steps instead of searching", 760, 135);
    text("  all elements", 760, 155);
    text("- Once the step element is larger than the target value", 760, 175);
    text("- Move backwards until target value is found or we", 760, 195);
    text("  reach the previous step element", 760, 215);
    text("- Means target element not in list", 770, 235);
    text("-  O(√n)", 760, 255);
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

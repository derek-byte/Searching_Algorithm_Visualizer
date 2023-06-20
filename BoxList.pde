class BoxList {
  int n; 
  int[] arr;
  int[] colors;
  int padding;
  int searchValue;
  
  BoxList(int n) {
    this.n = n;
    this.arr = generateRandomArray(this.n);
    this.padding = 50;
    this.searchValue = getRandomValue(this.arr); // What if there are 2 search values
  }
  
  void displayBoxes() {
    int containerWidth;
    if (isWindowIncreased) {
      containerWidth = width - 2*this.padding - screenIncreaseVal;
    }
    else {
      containerWidth = width - 2*this.padding;
    }
    int boxWidth = containerWidth/this.n-3;
    
    textAlign(CENTER, CENTER);
    for (int i=0; i<n; i++) {
      if (this.arr[i] == this.searchValue) 
        fill(150);
      else
        fill(255);
      textSize(13);
      square(boxWidth/2+(boxWidth+3)*i+this.padding, 200, boxWidth);
      fill(0);
      text(this.arr[i], boxWidth/2+(boxWidth+3)*i+this.padding, 200);
      
      textSize(10);
      fill(255);
      text(i, boxWidth/2+(boxWidth+3)*i+this.padding, 205+boxWidth/1.75);
    }
  }
  
  void drawLegend() {
    // Legend 
    textAlign(LEFT, CENTER);
    textSize(10);
    rect(600, 20, 25, 10);
    text("Comparing Value", 625, 20);
    rect(600, 31, 25, 10);
    text("Not Value", 625, 30);
    rect(600, 42, 25, 10);
    text("Yes Value", 625, 40);
    
    if (sortingAlgo.equals("Binary Search")) {
      rect(600, 53, 25, 10);
      text("Disregarded Values", 625, 50);
    }
  }
  
  void drawPointer(int i) {
    int containerWidth;
    if (isWindowIncreased) {
      containerWidth = width - 2*this.padding - screenIncreaseVal;
    }
    else {
      containerWidth = width - 2*this.padding;
    }
    int boxWidth = containerWidth/this.n-3;
    
    textAlign(CENTER, CENTER);
    
    //square(boxWidth/2+(boxWidth+3)*i+this.padding, 200, boxWidth);
    
    //noStroke();
    fill(255);
    // x=120
    rect(boxWidth/2+(boxWidth+3)*i+this.padding, 150, 15, 25);
    triangle(boxWidth/2+(boxWidth+3)*i+this.padding-15, 160, boxWidth/2+(boxWidth+3)*i+this.padding+15, 160, boxWidth/2+(boxWidth+3)*i+this.padding, 175);
  }
  
  void animateLinearSearch(int[] arr, int search) {
    for (int i=0; i<arr.length; i++) {
      displayBoxes();
      drawPointer(i);
      delay(500);
      if (arr[i] == search) {
        isAnimating = false;
        break;
        //return i;
      }
      println("HI");
    }
    //redraw();
    
    //return -1;
  }
  
  void animateBinarySearch(int[] arr, int currValue, int midValue) {
  
  }
  
  int[] generateRandomArray(int n) {
    int[] arr = new int[n];
    for (int i=0; i<n; i++) {
      arr[i] = int(random(1, 100));
    }
    
    println(sortingAlgo);
    if (sortingAlgo.equals("Binary Search") || sortingAlgo.equals("Jump Search")) {
      println("HI");
      return mergeSort(this.arr, 0, this.arr.length-1);
    }
    
    return arr;
  }
  
  int getRandomValue(int[] arr) {
    int randomValue = int(random(0, arr.length));
    searchValueInput.setText(str(arr[randomValue]));
    return arr[randomValue];
  }
}

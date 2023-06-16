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
    int containerWidth = width - 2*this.padding;
    int boxWidth = containerWidth/this.n-3;
    
    textAlign(CENTER, CENTER);
    textSize(13);
    for (int i=0; i<n; i++) {
      if (this.arr[i] == this.searchValue) 
        fill(150);
      else
        fill(255);
      square(boxWidth/2+(boxWidth+3)*i+this.padding, 200, boxWidth);
      fill(0);
      text(this.arr[i], boxWidth/2+(boxWidth+3)*i+this.padding, 200);
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
  
  void drawPointer() {
    noStroke();
    fill(255);
    rect(120, 150, 15, 25);
    triangle(105, 160, 135, 160, 120, 175);
  }
  
  void animateLinearSearch(int[] arr, int currValue) {
    
  }
  
  void animateBinarySearch(int[] arr, int currValue, int midValue) {
  
  }
  
  int[] generateRandomArray(int n) {
    int[] arr = new int[n];
    for (int i=0; i<n; i++) {
      arr[i] = int(random(1, 100));
    }
    
    println(sortingAlgo);
    if (sortingAlgo.equals("Binary Search")) {
      println("HI");
      return mergeSort(this.arr, 0, this.arr.length-1);
    }
    
    return arr;
  }
  
  int getRandomValue(int[] arr) {
    int randomIndex = int(random(0, arr.length));
    return arr[randomIndex];
  }
}

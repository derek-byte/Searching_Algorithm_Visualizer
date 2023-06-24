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
    } else {
      containerWidth = width - 2*this.padding;
    }
    int boxWidth = containerWidth/this.n-3;
    try {
      textAlign(CENTER, CENTER);
      for (int j=0; j<this.n; j++) {
        if (i == j && isAnimating)
          fill(245);
        else if (this.arr[j] == this.searchValue) 
          fill(245);
        else
          fill(boxBackground);
        textSize(13);
        square(boxWidth/2+(boxWidth+3)*j+this.padding, 200, boxWidth);
        fill(0);
        text(this.arr[j], boxWidth/2+(boxWidth+3)*j+this.padding, 200);
        
        textSize(10);
        fill(255);
        text(j, boxWidth/2+(boxWidth+3)*j+this.padding, 205+boxWidth/1.75);
      }
    } catch(IndexOutOfBoundsException e) {}
  }

  void drawPointer(int i) {
    int containerWidth;
    if (isWindowIncreased) {
      containerWidth = width - 2*this.padding - screenIncreaseVal;
    } else {
      containerWidth = width - 2*this.padding;
    }
    int boxWidth = containerWidth/this.n-3;
    
    textAlign(CENTER, CENTER);
    
    fill(255);
    rect(boxWidth/2+(boxWidth+3)*i+this.padding, 150-boxWidth/4, 15, 25);
    triangle(boxWidth/2+(boxWidth+3)*i+this.padding-15, 160-boxWidth/4, boxWidth/2+(boxWidth+3)*i+this.padding+15, 160-boxWidth/4, boxWidth/2+(boxWidth+3)*i+this.padding, 175-boxWidth/4);
  }
  
  int[] generateRandomArray(int n) { 
    int[] a = new int[n];
    for (int i=0; i<n; i++) {
      a[i] = int(random(1, 100));
    }
    
    println(sortingAlgo);
    if (sortingAlgo.equals("Binary Search") || sortingAlgo.equals("Jump Search")) {
      return mergeSort(a, 0, a.length-1);
    }
    
    return a;
  }
  
  int getRandomValue(int[] arr) {
    int randomValue = int(random(0, arr.length));
    searchValueInput.setText(str(arr[randomValue]));
    return arr[randomValue];
  }
}

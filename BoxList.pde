class BoxList {
  int n; 
  int[] arr;
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
  
  void initializeValues() {
    for (int i=0; i<n; i++) {
      arr[i] = int(random(100));
    }
  }
  
  int[] generateRandomArray(int n) {
    int[] arr = new int[n];
    for (int i=0; i<n; i++) {
      arr[i] = int(random(1, 100));
    }
    return arr;
  }
  
  int getRandomValue(int[] arr) {
    int randomIndex = int(random(0, arr.length));
    return arr[randomIndex];
  }
}

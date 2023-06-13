class BoxList {
  int n; 
  int[] arr;
  
  BoxList(int n) {
    this.n = n;
    this.arr = new int[this.n];
  }
  
  void displayBoxes() {
    for (int i=0; i<n; i++) {
      //square(20, i)
    }
  }
  
  void initializeValues() {
    for (int i=0; i<n; i++) {
      arr[i] = int(random(100));
    }
  }
}

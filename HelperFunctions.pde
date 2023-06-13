int linearSearch(int[] arr, int search) {
  for (int i=0; i<arr.length; i++) {
    if (arr[i] == search) {
      return i;
    }
  }
  
  return -1;
}

int binarySearch(int[] arr, int minIndex, int maxIndex, int search) { // Fix this
  if (maxIndex > minIndex) {
    int midIndex = (maxIndex + minIndex) / 2;
    println(minIndex, maxIndex, midIndex);
    if (arr[midIndex] == search) {
      return midIndex;
    }
    else if (arr[midIndex] < search) {
      return binarySearch(arr, midIndex, maxIndex, search);
    }
    else {
      return binarySearch(arr, minIndex, midIndex, search);
    }
  }
  
  return -1;
}

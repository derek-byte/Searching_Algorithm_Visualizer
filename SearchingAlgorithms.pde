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
      
  }
  while (i > prev) {
    if (arr[i] == search) {
    return i;
  }
    i--;
  }
  return -1;
}

int linearSearch(int[] arr, int search) {
  for (int i=0; i<arr.length; i++) {
    if (arr[i] == search) {
      return i;
    }
  }
  
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

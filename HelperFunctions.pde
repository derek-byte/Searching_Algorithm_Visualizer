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
    
    

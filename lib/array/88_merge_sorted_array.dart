void main() {
  // var list1 = [1, 2, 3, 0, 0, 0];
  // var list2 = <int>[2, 5, 6];
  // merge(list1, 3, list2, 3);
  // var list1 = [0];
  // var list2 = <int>[1];
  // merge(list1, 0, list2, 1);
  var list1 = [2,0];
  var list2 = <int>[1];
  merge(list1, 1, list2, 1);

  print(list1);
}

void merge(List<int> nums1, int m, List<int> nums2, int n) {
  // Initialize pointers for nums1 and nums2
  int i = m - 1;
  int j = n - 1;
  int k = m + n - 1;

  // Merge nums1 and nums2 by comparing elements from the end
  while (i >= 0 && j >= 0) {
    if (nums1[i] > nums2[j]) {
      nums1[k--] = nums1[i--];
    } else {
      nums1[k--] = nums2[j--];
    }
  }

  // Copy any remaining elements from nums2 to nums1
  for (int p = 0; p <= j; p++) {
    nums1[p] = nums2[p];
  }
}

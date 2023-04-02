void main(List<String> args) {
  print(findMedianSortedArrays([], []));
  // print(findMedianSortedArrays([8], [3]));
}

double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  if (nums1.isEmpty && nums2.isEmpty) {
    return 0;
  }
  bool even = (nums1.length + nums2.length) % 2 == 0;
  int index = (nums1.length + nums2.length) ~/ 2 - (even ? 1 : 0);
  int length = 0, median = 0;
  int i = 0, j = 0, count = 0;
  bool canBreak = false;
  while (i < nums1.length && j < nums2.length) {
    int min = 0;
    if (nums1[i] < nums2[j]) {
      min = nums1[i];
      i++;
    } else {
      min = nums2[j];
      j++;
    }
    length++;
    if (length == index + 1 || even && length == index + 2) {
      if (count > 0) {
        canBreak = true;
      }
      median += min;
      count++;
    }
    if (canBreak) {
      break;
    }
  }
  while (i < nums1.length) {
    int min = nums1[i];
    i++;
    length++;
    if (length == index + 1 || even && length == index + 2) {
      if (count > 0) {
        canBreak = true;
      }
      median += min;
    }
    if (canBreak) {
      break;
    }
  }
  while (j < nums2.length) {
    int min = nums2[j];
    j++;
    length++;
    if (length == index + 1 || even && length == index + 2) {
      if (count > 0) {
        canBreak = true;
      }
      median += min;
    }
    if (canBreak) {
      break;
    }
  }
  return even ? (median) / 2 : median.toDouble();
}

List<int> mergeTwoSortedList(List<int> nums1, List<int> nums2) {
  List<int> newList = [];
  int i = 0;
  int j = 0;
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] < nums2[j]) {
      newList.add(nums1[i]);
      i++;
    } else {
      newList.add(nums2[j]);
      j++;
    }
  }
  while (i < nums1.length) {
    newList.add(nums1[i]);
    i++;
  }
  while (j < nums2.length) {
    newList.add(nums2[j]);
    j++;
  }
  return newList;
}

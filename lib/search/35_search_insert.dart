void main() {
  print(searchInsert([1, 3, 5, 6], 5)); // 2
  print(searchInsert([1, 3, 5, 6], 2)); // 1
  print(searchInsert([1, 3, 5, 6], 7)); // 4
}

int searchInsert(List<int> nums, int target) {
  int left = 0;
  int right = nums.length;
  while (left < right) {
    final middle = left + (right - left) ~/ 2;
    if (nums[middle] == target) {
      return middle;
    } else if (target.compareTo(nums[middle]) < 0) {
      right = middle;
    } else {
      left = middle + 1;
    }
  }
  return left;
}

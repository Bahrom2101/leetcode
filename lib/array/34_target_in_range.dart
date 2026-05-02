void main() {
  print(searchRange([5, 7, 7, 8, 8, 8, 10], 8));
  // print(searchRange([1, 2, 2, 2, 4], 2)); // -1,-1
}

List<int> searchRange(List<int> nums, int target) {
  if (nums.length == 1 && nums[0] == target) {
    return [0, 0];
  }
  int left = 0;
  int right = nums.length - 1;

  int? min;
  int? max;

  while (left < right + 1) {
    if (nums[left] == target) {
      min ??= left;
      if (min > left) min = left;

      max ??= left;
      if (max < left) max = left;
    }
    if (nums[right] == target) {
      min ??= right;
      if (min > right) min = right;

      max ??= right;
      if (max < right) max = right;
    }
    left++;
    right--;
  }
  return [min ?? -1, max ?? -1];
}

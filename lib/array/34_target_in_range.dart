void main() {
  print(searchRange([5, 7, 7, 8, 8, 8, 10], 8));
  // print(searchRange([2, 2], 2));
}

List<int> searchRange(List<int> nums, int target) {
  if (nums.length == 1 && nums[0] == target) {
    return [0, 0];
  }
  List<int> targetList = [];
  int left = 0;
  int right = nums.length - 1;
  while (left < right + 1) {
    if (nums[left] == target) {
      targetList.add(left);
    }
    if (nums[right] == target) {
      targetList.add(right);
    }
    left++;
    right--;
  }
  targetList.sort();
  return [targetList.firstOrNull ?? -1, targetList.lastOrNull ?? -1];
}

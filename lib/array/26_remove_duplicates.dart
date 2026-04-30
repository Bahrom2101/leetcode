void main() {
  // var nums = [1, 1, 2];
  List<int> nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
  removeDuplicates(nums);
  print('nums: $nums');
}

int removeDuplicates(List<int> nums) {
  int duplicatesCount = nums.length - nums.toSet().length;
  int actualListLength = nums.length - duplicatesCount;
  int iterate = 0;
  while (nums.length > actualListLength) {
    if (nums[iterate] == nums[iterate + 1]) {
      nums.removeAt(iterate + 1);
    } else {
      iterate++;
    }
  }
  return actualListLength;
}

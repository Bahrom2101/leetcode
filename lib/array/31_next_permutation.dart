void main() {
  var sol = Solution();
  // sol.nextPermutation([1, 2, 3]);
  // sol.nextPermutation([2, 3, 1]);
  sol.nextPermutation([3, 2, 1]);
}

class Solution {
  void nextPermutation(List<int> nums) {
    int? pivot;
    for (int i = nums.length - 2; i >= 0; i--) {
      if (nums[i] < nums[i + 1]) {
        pivot = i;
        break;
      }
    }
    if (pivot == null) {
      nums.setRange(0, nums.length, nums.reversed.toList());
      return;
    }
    for (int i = nums.length - 1; i >= 0; i--) {
      if (nums[i] > nums[pivot]) {
        var k = nums[i];
        nums[i] = nums[pivot];
        nums[pivot] = k;

        nums.setRange(
            pivot + 1, nums.length, nums.sublist(pivot, nums.length).reversed);
        break;
      }
    }
  }
}

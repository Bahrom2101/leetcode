void main() {
  print(Solution().permute([5, 9]));
}

class Solution {
  List<List<int>> list = [];

  List<List<int>> permute(List<int> nums) {
    backtracking(nums, []);
    return list;
  }

  void backtracking(List<int> nums, List<int> current) {
    if (current.length == nums.length) {
      list.add([...current]);
      return;
    }
    for (int i = 1; i <= nums.length; i++) {
      if (!current.contains(nums[i - 1])) {
        current.add(nums[i - 1]);
        backtracking(nums, current);
        current.removeLast();
      }
    }
  }
}

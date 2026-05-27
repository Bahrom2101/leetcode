void main() {
  // [1,2,0] -> 3
  // [3,4,-1,1] -> 2
  // [7,8,9,11,12] -> 1
  print(Solution().firstMissingPositive([2, 1, 0]));
  print(Solution().firstMissingPositive([1, 2, 0]));
  print(Solution().firstMissingPositive([3, 4, -1, 1]));
  print(Solution().firstMissingPositive([7, 8, 9, 11, 12]));
}

class Solution {
  int firstMissingPositive(List<int> nums) {
    int n = nums.length;
    List<bool> seen = List.filled(n + 1, false);

    for (int num in nums) {
      if (num > 0 && num <= n) {
        seen[num] = true;
      }
    }

    for (int i = 1; i <= n; i++) {
      if (!seen[i]) {
        return i;
      }
    }

    return n + 1;
  }
}

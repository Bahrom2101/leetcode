void main() {
  print(twoSum([3, 2, 4], 6));
}

List<int> twoSum(List<int> nums, int target) {
  Map<int, int> visited = {};
  int len = nums.length;
  for (int i = 0; i < len; ++i) {
    int n = nums[i];
    int complement = target - n;
    if (visited.containsKey(complement)) {
      return [visited[complement]!, i];
    }
    visited[n] = i; // assume that each input would have exactly one solution
  }
  return [];
}

void main() {
  // print(threeSumClosest([-1, 2, 1, 4], 1)); // 2
  print(threeSumClosest([-10000, -10000, -10000], 10000)); // 0
  print(threeSumClosest([23, -2, 6, 95, 14, -31], 48));

  /// -31, -2, 6, 14, 23, 95
  ///  ^    j             k
}

int threeSumClosest(List<int> nums, int target) {
  nums.sort();
  int closestSum = nums[0] + nums[1] + nums[2];
  for (int i = 0; i < nums.length - 2; i++) {
    int left = i + 1; // Left pointer
    int right = nums.length - 1; // Right pointer
    while (left < right) {
      int sum = nums[i] + nums[left] + nums[right];
      if (sum == target) return sum; // Found exact match, return the sum
      if ((sum - target).abs() < (closestSum - target).abs()) {
        closestSum = sum; // Update closest sum if the current sum is closer to the target
      }
      if (sum < target) {
        left++; // Increment left pointer if sum is smaller than target
      } else {
        right--; // Decrement right pointer if sum is larger than target
      }
    }
  }
  return closestSum;
}

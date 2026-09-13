import 'dart:math';

void main() {
  // print(Solution().trap([4, 2, 0, 3, 2, 5]));
  print(Solution().trap([2, 1, 0, 1, 3, 2, 1, 2, 1]));
}

class Solution {
  int trap(List<int> height) {
    if (height.length <= 1) return 0;
    int max = 0;
    for (int i = 1; i < height.length; i++) {
      if (height[i] != height[i - 1]) {
        int left = i - 1;
        int right = i + 1;
        
      }
    }
    return max;
  }
}

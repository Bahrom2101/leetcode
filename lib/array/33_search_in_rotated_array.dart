void main() {
  print(Solution().search([4, 5, 6, 7, 0, 1, 2], 0)); // 4
}

class Solution {
  int search(List<int> nums, int target) {
    int lo = 0, hi = nums.length - 1;
    while (lo <= hi) {
      print('lo: $lo');
      print('hi: $hi');
      int mid = (lo + hi) ~/ 2;
      print('mid: $mid');
      if (nums[mid] == target) return mid;
      if (nums[lo] <= nums[mid]) {
        // left half is sorted
        if (nums[lo] <= target && target < nums[mid]) {
          hi = mid - 1;
        } else {
          lo = mid + 1;
        }
      } else {
        // right half is sorted
        if (nums[mid] < target && target <= nums[hi]) {
          lo = mid + 1;
        } else {
          hi = mid - 1;
        }
      }
    }
    return -1;
  }
}

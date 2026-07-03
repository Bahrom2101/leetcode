import 'package:leetcode/structures/tree_node.dart';

void main() {
  print(Solution().sortedArrayToBST([-10, -3, 0, 5, 9]));
}

class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    var mid = nums.length ~/ 2;
    print('mid: $mid');
    TreeNode? root = TreeNode(nums[mid]);
    var left = mid - 1;
    var right = mid + 1;
    root.left = TreeNode(nums[left]);
    root.right = TreeNode(nums[right]);
    left--;
    right++;
    root.left?.left = TreeNode(nums[left]);
    root.right?.right = TreeNode(nums[right]);
    left--;
    right++;
    // root.left?.left?.left = TreeNode(nums[left]);
    // root.right?.right?.right = TreeNode(nums[right]);

    // TreeNode? lPoint;
    // TreeNode? rPoint;
    // while (left >= 0 && right < nums.length) {
      // if (lPoint != null && rPoint != null) {
        // lPoint.left = TreeNode(nums[left]);
        // rPoint.right = TreeNode(nums[right]);
      // }
      // lPoint ??= TreeNode(nums[left]);
      // rPoint ??= TreeNode(nums[right]);
      // root.left = lPoint;
      // root.right = rPoint;

      // lPoint = root.left;
      // rPoint = root.right;
      // left--;
      // right++;
      // print('root: $root');
    // }
    return root;
  }
}

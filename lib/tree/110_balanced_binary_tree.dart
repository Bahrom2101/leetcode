import 'package:leetcode/structures/tree_node.dart';

void main() {
  // var one = TreeNode(1);
  // var two = TreeNode(2);
  // var three = TreeNode(3);
  // var four = TreeNode(4);
  // var two1 = TreeNode(2);
  // var three1 = TreeNode(3);
  // var four1 = TreeNode(4);
  // one.left = two;
  // one.right = two1;
  // two.left = three;
  // three.left = four;
  // two1.right = three1;
  // three1.right = four1;
  var three = TreeNode(3);
  var nine = TreeNode(9);
  var twenty = TreeNode(20);
  var fifteen = TreeNode(15);
  var seven = TreeNode(7);
  three.left = nine;
  three.right = twenty;
  twenty.left = fifteen;
  twenty.right = seven;
  print(isBalanced(three));
}

bool isBalanced(TreeNode? root) {
  if (root == null) return true;
  int leftHeight = maxDepth(root.left);
  int rightHeight = maxDepth(root.right);

  if (leftHeight == -1 || rightHeight == -1) return false;

  int diff = leftHeight - rightHeight;
  if (diff.abs() > 1) return false;

  return isBalanced(root.left) && isBalanced(root.right);
}

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  int left = 1;
  int right = 1;
  left += maxDepth(root.left);
  right += maxDepth(root.right);
  return right > left ? right : left;
}

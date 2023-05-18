import 'package:leetcode/structures/tree_node.dart';

void main() {
  var zero = TreeNode(0);
  var two = TreeNode(2);
  var three = TreeNode(3);
  var four = TreeNode(4);
  var five = TreeNode(5);
  var six = TreeNode(6);
  var seven = TreeNode(7);
  var eight = TreeNode(8);
  var nine = TreeNode(9);
  six.left = two;
  six.right = eight;
  two.left = zero;
  two.right = four;
  four.left = three;
  four.right = five;
  eight.left = seven;
  eight.right = nine;

  print(lowestCommonAncestor(six, zero, four));
}

TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
  TreeNode? node;
  if (root == null || root.left == p || root.right == q) return root;
  var left = lowestCommonAncestor(root.left, p,q );
  if (left?.left == p || left?.right == q) {
    return left;
  }
  var right = lowestCommonAncestor(root.right, p,q );
  if (right?.left == p || right?.right == q) {
    return right;
  }
  return node;
}
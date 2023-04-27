import 'package:leetcode/structures/tree_node.dart';

void main() {
  var one = TreeNode(1);
  var two = TreeNode(2);
  var three = TreeNode(3);
  var four = TreeNode(4);
  var six = TreeNode(6);
  var seven = TreeNode(7);
  var nine = TreeNode(9);
  four.left = two;
  four.right = seven;
  two.left = one;
  two.right = three;
  seven.right = nine;
  seven.left = six;
  print(invertTree(four));
}

TreeNode? invertTree(TreeNode? root) {
  if (root == null) return null;
  var tempLeft = root.left;
  root.left = root.right;
  root.right = tempLeft;
  invertTree(root.right);
  invertTree(root.left);
  return root;
}

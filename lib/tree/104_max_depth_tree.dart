import 'package:leetcode/structures/tree_node.dart';

void main(List<String> args) {
  var tree = createBinaryTree();
  print(tree);
  print(maxDepth(tree));
}

int maxDepth(TreeNode? root) {
  if (root == null) return 0;
  int left = 1;
  int right = 1;
  left += maxDepth(root.left);
  right += maxDepth(root.right);
  return right > left ? right : left;
}

TreeNode createBinaryTree() {
  final one = TreeNode(1);
  final five = TreeNode(5);
  final two = TreeNode(2);
  final three = TreeNode(3);
  final four = TreeNode(4);
  one.left = two;
  one.right = three;
  two.left = four;
  two.right = five;
  return one;
}

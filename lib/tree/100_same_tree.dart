import 'package:leetcode/structures/tree_node.dart';

void main(List<String> args) {
  final tree1 = TreeNode(2);
  tree1.right = TreeNode(2);
  final tree2 = TreeNode(2);
  tree2.left = TreeNode(3);
  tree2.right = TreeNode(4);
  print(tree1);
  print(tree2);
  print(isSameTree(tree1, tree2));
}

bool isSameTree(TreeNode? p, TreeNode? q) {
  if (p == null && q == null) return true;
  if (p?.val != q?.val) {
    return false;
  }
  return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right);
}

TreeNode createBinaryTree(bool isSecond) {
  final zero = TreeNode(0);
  final one = TreeNode(1);
  final four = TreeNode(4);
  final five = TreeNode(5);
  final seven = TreeNode(7);
  final eight = TreeNode(8);
  final nine = TreeNode(9);
  final two = TreeNode(2);
  final three = TreeNode(3);
  five.left = three;
  five.right = four;
  three.left = one;
  three.right = two;
  four.left = seven;
  if (!isSecond) {
    four.right = eight;
  }
  return five;
}

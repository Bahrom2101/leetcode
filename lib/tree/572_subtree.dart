import '../structures/tree_node.dart';

void main(List<String> args) {
  final one = TreeNode(1);
  final two = TreeNode(2);
  final one1 = TreeNode(1);
  final two1 = TreeNode(2);
  final three = TreeNode(3);
  final four = TreeNode(4);
  final four1 = TreeNode(4);
  final five = TreeNode(5);
  final root = three;
  root.left = four;
  root.right = five;
  four.left = one;
  four.right = two;
  two.left = four1;
  four1.left = one1;
  four1.right = two1;
  final subRoot = four1;
  print(root);
  print(subRoot);
  print(isSubtree(root, subRoot));
}

bool isSubtree(TreeNode? root, TreeNode? subRoot) {
  if (root == null) return false;
  if (_isSubtree(root, subRoot)) return true;
  return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
}

bool _isSubtree(TreeNode? root, TreeNode? subRoot) {
  if (root == null && subRoot == null) return true;
  if (root == null || subRoot == null) return false;

  if (root.val != subRoot.val) return false;

  return _isSubtree(root.left, subRoot.left) && _isSubtree(root.right, subRoot.right);
}

import 'package:leetcode/structures/tree_node.dart';

void main() {
  final one = TreeNode(1);
  final two1 = TreeNode(2);
  final two2 = TreeNode(2);
  final three1 = TreeNode(3);
  final three2 = TreeNode(3);
  final four1 = TreeNode(4);
  final four2 = TreeNode(4);
  one.left = two1;
  one.right = two2;
  two1.left = three1;
  two1.right = four1;
  two2.left = four2;
  two2.right = three2;
  print(one);
  print(isSymmetric(one));
}

bool isSymmetric(TreeNode? root) {
  if (root == null) return true;
  return isSymmetricHelper(root.left, root.right);
}

bool isSymmetricHelper(TreeNode? leftNode, TreeNode? rightNode) {
  if (leftNode == null && rightNode == null) {
    return true;
  }

  if (leftNode != null && rightNode != null && leftNode.val == rightNode.val) {
    return (isSymmetricHelper(leftNode.left, rightNode.right) &&
        isSymmetricHelper(leftNode.right, rightNode.left));
  }
  return false;
}

import 'package:leetcode/structures/tree_node.dart';

void main(List<String> args) {
  final tree = createBinaryTree([4, 2, 7, 1, 3]);
  print(tree);
  print(searchBST(tree, 2));
}

TreeNode? searchBST(TreeNode? root, int val) {
  TreeNode? node;
  if (root == null || root.val == val) return root;
  if (searchBST(root.left, val)?.val == val) {
    return searchBST(root.left, val);
  }
  if (searchBST(root.right, val)?.val == val) {
    return searchBST(root.right, val);
  }
  return node;
}

TreeNode? createBinaryTree(List<int?> list) {
  final one = TreeNode(1);
  final two = TreeNode(2);
  final three = TreeNode(3);
  final four = TreeNode(4);
  final five = TreeNode(5);
  final six = TreeNode(6);
  final seven = TreeNode(7);

  four.left = two;
  four.right = seven;

  two.left = null;
  two.right = one;

  seven.left = three;
  seven.right = null;

  one.left = five;
  one.right = six;

  return four;
}

TreeNode? createRecursively(List<int?> list, TreeNode? root, int index) {
  root?.left = createRecursively(list, root, index);
  return root;
}

import 'package:leetcode/structures/tree_node.dart';

void main() {
  TreeNode one = TreeNode(1);
  TreeNode two = TreeNode(2);
  TreeNode three = TreeNode(3);
  TreeNode five = TreeNode(5);
  TreeNode one1 = TreeNode(1);
  TreeNode two1 = TreeNode(2);
  TreeNode three1 = TreeNode(3);
  TreeNode four = TreeNode(4);
  TreeNode seven = TreeNode(7);
  one.left = three;
  one.right = two;
  three.left = five;

  two1.left = one1;
  two1.right = three1;
  one1.right = four;
  three1.right = seven;

  print(mergeTrees(one, two1));
}

TreeNode? mergeTrees(TreeNode? root1, TreeNode? root2) {
  if (root1 == null) {
    return root2;
  }
  if (root2 == null) {
    return root1;
  }
  TreeNode newTree = TreeNode(root1.val + root2.val);

  newTree.left = mergeTrees(root1.left, root2.left);
  newTree.right = mergeTrees(root1.right, root2.right);

  return newTree;
}

import 'package:leetcode/structures/tree_node.dart';

void main(List<String> args) {
  // 9980, 9740,   null,   9680,   null,    9355,   null,   9309,   null,   8473,   null,   8397,   null,   8391,   null,   8326,   null,   8188,   null, 7999,    null,   7950,   null,   7846,   null,   7574,   null,   7569,   null,   7386,   null,   7188,   null,   7039,   null,
  //   6723,  null,  6706,  null,  6623,  null,  6612,  null,  6480,  null,  6469,  null,  6454,  null,  6328,  null,  6286,  null, 6276,   null,   5989,   null,   5928,   null,   5924,   null,   5903,   null,   5837,   null,   5635,   null,   5596,   null,
  //  5550,  null,  5495,  null,  5465,  null,  5109,  null,  4962,  null,  4687,   null,  4598,  null,  4570,  null,  4529,  null,  4426,  null, 4294, null,   4261,   null,   4180,   null,   4113,   null,   4106,   null,   4042,   null,   4023,   null,   4020,   null,   3998,   null, 3864,   null,   3863,   null,   3841,   null,   3822,   null,   3700,   null,   3613,   null,   3599,   null,   3598,   null,
  //   3561,   null,   3434,   null,   3365,   null,   3318,   null,   3209,   null,   3075,   null,   2999,   null,   2876,   null,   2857,   null, 2672,    null,    2538,    null,    2518,   null, 2338,   null,    2293,    null,    2265,    null,    2175,    null,    null,    1915,    null,  1579,    null,    1512,    null,    1499,    null,    1404,    null,    1337,    null,    1323,    null,    975,    null,    800,    null,    766,null,   671,   null,   566,    null,    555,    null,    501,    null,    343,    null,    279,    null,    236,    null,    175,    null,    117,   null,60,null, 19,  null,   null,null
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

  // if (list.isEmpty) return null;
  // if (list[0] == null) return null;

  // TreeNode? root = TreeNode(list[0]!);
  // root = createRecursively(list, root, 1);
  return four;
}

TreeNode? createRecursively(List<int?> list, TreeNode? root, int index) {
  root?.left = createRecursively(list, root, index);
  return root;
}

import 'package:leetcode/structures/tree_node.dart';

void main() {
  // 3 9 20 15 7
  var three = TreeNode(3);
  var seven = TreeNode(7);
  var nine = TreeNode(9);
  var fifteen = TreeNode(15);
  var twenty = TreeNode(20);
  var one = TreeNode(1);
  var two = TreeNode(2);
  three.left = nine;
  three.right = twenty;
  nine.left = one;
  nine.right = two;
  twenty.left = fifteen;
  twenty.right = seven;
  print(levelOrder(three));
}

List<List<int>> levelOrder(TreeNode? root) {
  if (root == null) return [];
  Map<int, List<int>> map = {};
  levelTraverse(root, 0, (value, level) {
    map[level] = [...(map[level] ?? []), value];
  });
  return map.values.toList();
}

void levelTraverse(
    TreeNode? tree, int level, Function(int value, int level) action) {
  if (tree == null) return;
  action(tree.val, level);
  levelTraverse(tree.left, level + 1, action);
  levelTraverse(tree.right, level + 1, action);
}

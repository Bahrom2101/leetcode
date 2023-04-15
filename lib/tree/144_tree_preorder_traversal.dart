import 'package:leetcode/structures/tree_node.dart';

void main() {
  var one = TreeNode(1);
  var two = TreeNode(2);
  var four = TreeNode(4);
  var four1 = TreeNode(4);
  var five = TreeNode(5);
  var seven = TreeNode(7);
  var eight = TreeNode(8);
  var eleven = TreeNode(11);
  var thirteen = TreeNode(13);
  five.left = four;
  four.left = eleven;
  eleven.left = seven;
  eleven.right = two;
  five.right = eight;
  eight.left = thirteen;
  eight.right = four1;
  four1.right = one;
  print(preorderTraversal(five));
}

List<int> preorderTraversal(TreeNode? root) {
  if (root == null) return [];
  List<int> values = [];
  traversePreOrder(root, (value) {
    values.add(value);
  });
  return values;
}

void traversePreOrder(TreeNode? root, void Function(int value) action) {
  if (root == null) return;
  action(root.val);
  traversePreOrder(root.left, action);
  traversePreOrder(root.right, action);
}

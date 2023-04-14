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
  print(inorderTraversal(five, 22));
}

bool inorderTraversal(TreeNode? root, int targetSum) {
  if (root == null) return false;
  List<int> values = [];
  traverseInOrder(root, (value) {
    print(value);
  });
  print(values);
  return true;
}


void traverseInOrder(TreeNode? root, void Function(int value) action) {
  if (root == null) return;
  action(root.val);
  traverseInOrder(root.left, action);
  traverseInOrder(root.right, action);
}

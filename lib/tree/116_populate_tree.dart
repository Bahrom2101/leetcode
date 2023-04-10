import 'dart:collection';

import 'package:leetcode/structures/tree_node.dart';

void main() {
  TreeNode one = TreeNode(1);
  TreeNode two = TreeNode(2);
  TreeNode three = TreeNode(3);
  TreeNode four = TreeNode(4);
  TreeNode five = TreeNode(5);
  TreeNode six = TreeNode(1);
  TreeNode seven = TreeNode(7);

  one.left = two;
  one.right = three;
  two.left = four;
  two.right = five;
  three.left = six;
  three.right = seven;
  connect(one);
}

TreeNode? connect(TreeNode? root) {
  if (root == null) {
    return null;
  }

  Queue<TreeNode> queue = Queue();
  queue.add(root);

  while (queue.isNotEmpty) {
    int size = queue.length;

    TreeNode? prevNode;

    for (int i = 0; i < size; i++) {
      TreeNode node = queue.removeFirst();
      prevNode?.next = node;
      prevNode = node;
      if (node.left != null) {
        queue.add(node.left!);
      }

      if (node.right != null) {
        queue.add(node.right!);
      }
    }
  }
  return root;
}

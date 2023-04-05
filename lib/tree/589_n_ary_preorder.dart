import 'dart:collection';

import '../structures/node.dart';

void main() {
  var one = Node(1);
  var two = Node(2);
  var three = Node(3);
  var four = Node(4);
  var five = Node(5);
  var six = Node(6);
  var seven = Node(7);
  var eight = Node(8);
  var nine = Node(9);
  var ten = Node(10);
  var eleven = Node(11);
  var twelve = Node(12);
  var thirteen = Node(13);
  var fourteen = Node(14);
  one.children = [two, three, four, five];
  three.children = [six, seven];
  seven.children = [eleven];
  eleven.children = [fourteen];
  four.children = [eight];
  eight.children = [twelve];
  five.children = [nine, ten];
  nine.children = [thirteen];
  print(preorder(null));
}

List<int> preorder(Node? root) {
  if(root == null) return [];
  List<int> list = [];
  traversePreOrder(root, list);
  return list;
}

void traversePreOrder(Node root, List<int> list) {
  list.add(root.val);
  for (var element in root.children) {
    traversePreOrder(element, list);
  }
}

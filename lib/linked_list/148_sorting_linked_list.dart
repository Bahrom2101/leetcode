// ignore_for_file: file_names

import '../structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(5);
  list.next = ListNode(23);
  list.next?.next = ListNode(2);
  list.next?.next?.next = ListNode(13);
  list.next?.next?.next?.next = ListNode(100);
  list.next?.next?.next?.next?.next = ListNode(10);
  print(sortList(list));
}

ListNode? sortList(ListNode? head) {
  while (head?.next != null) {
    if ((head?.val ?? 0) > (head?.next?.val ?? 0)) {}
  }
  return null;
}

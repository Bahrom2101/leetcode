import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  var list = ListNode(1);
  list.next = ListNode(2);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(4);
  list.next?.next?.next?.next = ListNode(5);
  print(removeNthFromEnd(list, 2));
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  ListNode newList = ListNode();
  ListNode? temp = newList;
  int length = 0;
  while (head != null) {
    temp?.next = ListNode(head.val);
    temp = temp?.next;
    head = head.next;
    length++;
  }
  head = newList.next;
  newList = ListNode();
  temp = newList;
  int i = 0;
  while (head != null) {
    if (i != length - n) {
      temp?.next = ListNode(head.val);
      temp = temp?.next;
    }
    i++;
    head = head.next;
  }
  return newList.next;
}

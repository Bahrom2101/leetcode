import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(2);
  list.next = ListNode(1);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(5);
  list.next?.next?.next?.next = ListNode(6);
  list.next?.next?.next?.next?.next = ListNode(4);
  list.next?.next?.next?.next?.next?.next = ListNode(7);
  print(reverseList(list));
}

ListNode? reverseList(ListNode? head) {
  return reverseRecursively(null, head);
}

ListNode? reverseRecursively(ListNode? prev, ListNode? head) {
  if (head == null) return null;
  if (head.next == null) {
    head.next = prev;
    return head;
  }
  ListNode? tempNext = head.next;
  head.next = prev;
  return reverseRecursively(head, tempNext);
}

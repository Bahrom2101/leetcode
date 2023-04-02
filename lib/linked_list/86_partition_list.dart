import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(1);
  list.next = ListNode(4);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(2);
  list.next?.next?.next?.next = ListNode(5);
  list.next?.next?.next?.next?.next = ListNode(2);
  print(partition(list, 3));
  // the result must be 5, 23, 2, 10, 13, 100
}

ListNode? partition(ListNode? head, int x) {
  ListNode l1 = ListNode(0);
  ListNode l2 = ListNode(0);
  ListNode? temp1 = l1;
  ListNode? temp2 = l2;
  while (head != null) {
    if ((head.val) >= x) {
      temp1?.next = ListNode(head.val);
      temp1 = temp1?.next;
    } else {
      temp2?.next = ListNode(head.val);
      temp2 = temp2?.next;
    }
    head = head.next;
  }
  temp2?.next = l1.next;
  return l2.next;
}

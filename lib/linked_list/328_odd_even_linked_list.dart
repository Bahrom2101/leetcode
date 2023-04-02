import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(2);
  list.next = ListNode(1);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(5);
  list.next?.next?.next?.next = ListNode(6);
  list.next?.next?.next?.next?.next = ListNode(4);
  list.next?.next?.next?.next?.next?.next = ListNode(7);
  print(oddEvenList(list));
}

ListNode? oddEvenList(ListNode? head) {
  ListNode l1 = ListNode(0);
  ListNode l2 = ListNode(0);
  ListNode? temp1 = l1;
  ListNode? temp2 = l2;
  int index = 0;
  while (head != null) {
    if (index % 2 == 0) {
      temp1?.next = ListNode(head.val);
      temp1 = temp1?.next;
    } else {
      temp2?.next = ListNode(head.val);
      temp2 = temp2?.next;
    }
    head = head.next;
    index++;
  }
  temp1?.next = l2.next;
  return l1.next;
}

import '../structures/list_node.dart';

void main() {
  ListNode list = ListNode(2);
  ListNode? l = list;
  for (int i = 0; i < 1; i++) {
    l?.next = ListNode(i);
    l = l?.next;
  }
  print(list.next);
  print(middleNode(list.next));
}

ListNode? middleNode(ListNode? head) {
  ListNode? fast = head?.next;
  ListNode? slow = head;
  while (fast != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }
  return slow;
}

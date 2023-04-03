import '../structures/list_node.dart';

void main() {
  ListNode node1 = ListNode(3);
  ListNode node2 = ListNode(2);
  ListNode node3 = ListNode(0);
  ListNode node4 = ListNode(-4);
  ListNode node5 = ListNode(2);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;
  node5.next = node2;
  print(detectCycle1(node1));
}

ListNode? detectCycle1(ListNode? head) {
  if (head == null || head.next == null) {
    return null;
  }
  ListNode? slow = head;
  ListNode? fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
    if (slow == fast) {
      ListNode? ptr1 = head;
      while (ptr1 != slow) {
        ptr1 = ptr1!.next;
        slow = slow!.next;
      }
      return ptr1;
    }
  }
  return null;
}

ListNode? detectCycle(ListNode? head) {
  ListNode? fast = head?.next;
  ListNode? slow = head;
  while (fast != null) {
    if (fast == slow) {
      return slow;
    }
    slow = slow?.next;
    fast = fast.next?.next;
  }
  return null;
}

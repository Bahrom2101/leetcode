import '../structures/list_node.dart';

void main() {
  ListNode list = ListNode(1);
  list.next = ListNode(2);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(4);
  list.next?.next?.next?.next = ListNode(5);
  list.next?.next?.next?.next?.next = ListNode(6);
  list.next?.next?.next?.next?.next?.next = ListNode(7);
  list.next?.next?.next?.next?.next?.next?.next = ListNode(8);
  print(list);
  print(swapNodes1(list, 3));
}

ListNode? swapNodes1(ListNode? head, int k) {
  ListNode? t1 = head;
  ListNode? t2 = head;
  ListNode? t3 = head;
  ListNode? t4 = head;
  ListNode? t5 = head;
  int i = 1;
  while (t3?.next != null) {
    i++;
    if (i <= k) {
      t5 = t1;
      t3 = t3?.next;
      t1 = t1?.next;
    } else {
      t4 = t2;
      t3 = t3?.next;
      t2 = t2?.next;
    }
  }
  int n = 0;
  if (t1?.next == null) {
    n = 1;
  }
  if (n == 1) {
    t5?.next = t2;
    t1?.next = t2?.next;
    t2?.next = null;
    head = t1;
  } else if (k == 1) {
    t4?.next = t1;
    t2?.next = t1?.next;
    t1?.next = null;
    head = t2;
  } else {
    t5?.next = t4?.next;
    t4?.next = t1;
    ListNode? p = t1?.next;
    t1?.next = t2?.next;
    t2?.next = p;
  }
  return head;
}

ListNode? swapNodes(ListNode? head, int k) {
  ListNode dummy = ListNode(0, head);
  ListNode? slow = dummy;
  ListNode? fast = dummy;
  for (int i = 0; i < k; i++) {
    fast = fast!.next;
  }

  ListNode? node1 = fast;
  while (fast != null) {
    fast = fast.next;
    slow = slow!.next;
  }

  ListNode? node2 = slow;

  int temp = node1!.val;
  node1.val = node2!.val;
  node2.val = temp;

  return dummy.next!;
}

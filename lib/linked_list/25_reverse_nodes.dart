import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(1);
  list.next = ListNode(2);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(4);
  list.next?.next?.next?.next = ListNode(5);
  list.next?.next?.next?.next?.next = ListNode(6);
  list.next?.next?.next?.next?.next?.next = ListNode(7);
  list.next?.next?.next?.next?.next?.next?.next = ListNode(8);
  print(reverseKGroup1(list, 3));
}

ListNode? reverseKGroup2(ListNode? head, int k) {
  ListNode? dummy = ListNode(0, head);
  ListNode? prevGroupTail = dummy;

  while (true) {
    ListNode? groupStart = prevGroupTail?.next;
    ListNode? groupEnd = groupStart;
    ListNode? nextGroupStart = groupEnd?.next;
    int count = k;
    while (count-- > 0 && groupEnd != null) {
      groupEnd = groupEnd.next;
    }
    if (count > 0 || groupEnd == null) {
      break;
    }
    groupEnd = groupStart;
    ListNode? prev = nextGroupStart;
    while (groupEnd != nextGroupStart) {
      ListNode? temp = groupEnd?.next;
      groupEnd?.next = prev;
      prev = groupEnd;
      groupEnd = temp;
    }
    ListNode? temp = prevGroupTail?.next;
    prevGroupTail?.next = groupEnd;
    prevGroupTail = temp!;
  }

  return dummy.next!;
}

ListNode? reverseKGroup1(ListNode? head, int k) {
  ListNode? curr = head;
  int count = 0;

  // Count the number of nodes in the first group of k nodes.
  while (curr != null && count < k) {
    curr = curr.next;
    count++;
  }
  print('count: $count');
  print('k: $k');
  print('curr: $curr');
  // If there are k nodes, reverse them and move to the next group of k nodes.
  if (count == k) {
    curr = reverseKGroup1(curr, k);
    while (count > 0) {
      count--;
      ListNode? temp = head?.next;
      head?.next = curr;
      curr = head;
      head = temp;
    }
    head = curr;
  }

  return head;
}

ListNode? reverseList(ListNode? head) {
  ListNode? newList;
  while (head != null) {
    newList = ListNode(head.val, newList);
    head = head.next;
  }
  return newList;
}

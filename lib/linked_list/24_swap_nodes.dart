import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(2);
  list.next = ListNode(1);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(5);
  list.next?.next?.next?.next = ListNode(6);
  list.next?.next?.next?.next?.next = ListNode(4);
  list.next?.next?.next?.next?.next?.next = ListNode(7);
  print(list);
  print(swapPairs2(list));
}

ListNode? swapPairs(ListNode? head) {
  int count = 0;
  ListNode newList = ListNode(0);
  ListNode? temp = newList;
  ListNode? prev = head;
  while (head?.next != null) {
    if (count % 2 == 0) {
      prev = head;
    } else {
      temp.next = head;
      temp.next?.next = prev;
    }
    head = head?.next;
    count++;
  }

  return newList.next;
}

ListNode? swapPairs1(ListNode? head) {
  if (head != null) {
    if (head.next == null) {
      return head;
    }
  }
  if (head?.next == null) return null;
  int val = head!.next!.val;
  head.next?.val = head.val;
  head.val = val;

  return ListNode(
      head.val, ListNode(head.next!.val, swapPairs(head.next?.next)));
}

ListNode? swapPairs2(ListNode? head) {
  ListNode temp = ListNode(0);
  temp.next = head;
  // temp = 0 -> 2 -> 1 -> 3 -> 5 -> 4 -> 6 -> 7 -> null
  ListNode? first = head;
  if (head != null && head.next != null) {
    first = head.next;
    // first = 1 -> 3 -> 5 -> 4 -> 6 -> 7 -> null
  }
  while (temp.next != null && temp.next!.next != null) {
    ListNode? node1 = temp.next;
    ListNode? node2 = temp.next!.next;
    temp.next = node2;
    node1!.next = node2!.next;
    node2.next = node1;
    temp = node1;
  }
  return first;
}

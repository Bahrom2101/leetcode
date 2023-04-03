import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(2);
  ListNode? l = list;
  for (int i = 0; i < 200000000; i++) {
    l?.next = ListNode(i);
    l = l?.next;
  }
  var a = DateTime.now();
  reverseList1(list.next);
  var b = DateTime.now();
  print(b.difference(a).inMilliseconds);
  a = DateTime.now();
  reverseList2(list.next);
  b = DateTime.now();
  print(b.difference(a).inMilliseconds);
}
// 7533
// 1013

ListNode? reverseList1(ListNode? head) {
  if (head == null) {
    return null;
  } else if (head.next == null) {
    return head;
  } else {
    List<int> stack = [];

    while (head != null) {
      stack.add(head.val);
      head = head.next;
    }

    for (var i = 0; i < stack.length; i++) {
      var temp = ListNode(stack[i]);
      temp.next = head;
      head = temp;
    }
    return head;
  }

  // return reverseRecursively(null, head);
}

ListNode? reverseList2(ListNode? head) {
  ListNode? current = head;
  ListNode? prev;

  while (current != null) {
    ListNode? next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  return prev;
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

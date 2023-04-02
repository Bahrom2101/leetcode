
void main(List<String> args) {
  ListNode l1 = ListNode(9);
  l1.next = ListNode(9);
  l1.next?.next = ListNode(9);
  l1.next?.next?.next = ListNode(9);
  l1.next?.next?.next?.next = ListNode(9);
  l1.next?.next?.next?.next?.next = ListNode(9);
  l1.next?.next?.next?.next?.next?.next = ListNode(9);

  ListNode l2 = ListNode(9);
  l2.next = ListNode(9);
  l2.next?.next = ListNode(9);
  l2.next?.next?.next = ListNode(9);
  print(l1.toString());
  print(l2.toString());
  print(addTwoNumbers(l1, l2));
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode? list = ListNode();
  ListNode? current = list;
  int memoize = 0;
  while (l1 != null && l2 != null) {
    current?.next = ListNode((memoize + l1.val + l2.val) % 10);
    current = current?.next;
    memoize = (memoize + l1.val + l2.val) ~/ 10;
    l1 = l1.next;
    l2 = l2.next;
  }
  while (l1 != null) {
    current?.next = ListNode((memoize + l1.val) % 10);
    current = current?.next;
    memoize = (memoize + l1.val) ~/ 10;
    l1 = l1.next;
  }
  while (l2 != null) {
    current?.next = ListNode((memoize + l2.val) % 10);
    current = current?.next;
    memoize = (memoize + l2.val) ~/ 10;
    l2 = l2.next;
  }
  if(memoize > 0) {
    current?.next = ListNode(memoize % 10);
    current = current?.next;
  }
  return list.next;
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() {
    return '$val -> $next';
  }
}

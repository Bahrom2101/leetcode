void main(List<String> args) {
  ListNode l = ListNode(1);
  l.next = ListNode(2);
  l.next?.next = ListNode(6);
  l.next?.next?.next = ListNode(3);
  l.next?.next?.next?.next = ListNode(4);
  l.next?.next?.next?.next?.next = ListNode(5);
  l.next?.next?.next?.next?.next?.next = ListNode(6);
  ListNode l1 = ListNode(1);
  l1.next = ListNode(1);
  l1.next?.next = ListNode(1);
  l1.next?.next?.next = ListNode(1);
  l1.next?.next?.next?.next = ListNode(1);
  l1.next?.next?.next?.next?.next = ListNode(1);
  l1.next?.next?.next?.next?.next?.next = ListNode(1);
  print(removeElements(l1, 1));
}

ListNode? removeElements(ListNode? head, int val) {
  ListNode newList = ListNode();
  ListNode? temp = newList;
  while (head != null) {
    if (head.val != val) {
      temp?.next = ListNode(head.val);
      temp = temp?.next;
    }
    head = head.next;
  }
  return newList.next;
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

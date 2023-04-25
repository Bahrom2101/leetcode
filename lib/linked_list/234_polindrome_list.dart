import '../structures/list_node.dart';

void main() {
  var list = ListNode(1);
  list.next = ListNode(2);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(3);
  list.next?.next?.next?.next = ListNode(3);
  list.next?.next?.next?.next?.next = ListNode(3);
  list.next?.next?.next?.next?.next?.next = ListNode(2);
  list.next?.next?.next?.next?.next?.next?.next = ListNode(1);
  print(list);
  print(isPalindrome(list));
}

bool isPalindrome(ListNode? head) {
  ListNode? temp = head;
  ListNode? newList = ListNode(head?.val ?? 0);
  head = head?.next;
  while (head != null) {
    var node = ListNode(head.val);
    node.next = newList;
    newList = node;
    head = head.next;
  }
  while (temp != null) {
    if (temp.val != newList?.val) {
      return false;
    }
    temp = temp.next;
    newList = newList?.next;
  }
  return true;
}

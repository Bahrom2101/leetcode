import '../structures/list_node.dart';

void main() {
  ListNode l1 = ListNode(1);
  l1.next = ListNode(2);
  l1.next?.next = ListNode(4);
  ListNode l2 = ListNode(1);
  l2.next = ListNode(3);
  l2.next?.next = ListNode(4);
  print(mergeTwoLists(l1, l2));
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  ListNode? newList = ListNode();
  ListNode? temp = newList;
  while (list1 != null && list2 != null) {
    if (list1.val < list2.val) {
      temp?.next = list1;
      list1 = list1.next;
    } else {
      temp?.next = list2;
      list2 = list2.next;
    }
    temp = temp?.next;
  }
  if (list1 != null) {
    temp?.next = list1;
  }
  if (list2 != null) {
    temp?.next = list2;
  }
  return newList.next;
}

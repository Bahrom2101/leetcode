import 'package:leetcode/structures/list_node.dart';

void main(List<String> args) {
  ListNode l1 = ListNode(1);
  l1.next = ListNode(4);
  l1.next?.next = ListNode(5);
  ListNode l2 = ListNode(1);
  l2.next = ListNode(3);
  l2.next?.next = ListNode(4);
  ListNode l3 = ListNode(2);
  l3.next = ListNode(6);
  List<ListNode?> lists = [];
  lists
    ..add(l1)
    ..add(l2)
    ..add(l3);
  print(lists);
  print(mergeKLists(lists));
}

ListNode? mergeKLists(List<ListNode?> lists) {
  if (lists.isEmpty) return null;
  ListNode? newList = lists[0];
  for (int i = 1; i < lists.length; i++) {
    newList = mergeTwoLists(newList, lists[i]);
  }
  return newList;
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  if (list1 == null) return list2;
  if (list2 == null) return list1;
  ListNode? newList = ListNode();
  ListNode? temp = newList;
  while (list1 != null && list2 != null) {
    if (list1.val <= list2.val) {
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

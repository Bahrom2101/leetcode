// ignore_for_file: file_names

import '../structures/list_node.dart';

void main(List<String> args) {
  ListNode list = ListNode(-1);
  list.next = ListNode(5);
  list.next?.next = ListNode(3);
  list.next?.next?.next = ListNode(6);
  list.next?.next?.next?.next = ListNode(0);
  print(sortList(list));
}

ListNode? sortList(ListNode? head) {
  return mergeSort(head);
}

ListNode? mergeSort(ListNode? list) {
  int length = 0;
  var temp = list;
  while (temp != null) {
    temp = temp.next;
    length++;
  }
  if (length < 2) return list;
  final middle = length ~/ 2;

  ListNode? newList = ListNode();
  temp = newList;
  while (length != middle) {
    temp?.next = ListNode(list!.val);
    temp = temp?.next;
    list = list?.next;
    length--;
  }
  final left = mergeSort(newList.next);
  final right = mergeSort(list);
  return mergeTwoLists(left, right);
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

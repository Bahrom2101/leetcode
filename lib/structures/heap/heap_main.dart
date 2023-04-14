import 'heap.dart';

void main() {
  var heap = Heap(elements: [2,7,4,1,9,1],priority: Priority.max);
  print(heap);
  
}

bool isMinHeap1<E extends Comparable<dynamic>>(List<E> elements) {
  if (elements.isEmpty) return true;
  final start = elements.length ~/ 2 - 1;
  for (var i = start; i >= 0; i--) {
    final left = 2 * i + 1;
    final right = 2 * i + 2;
    if (elements[left].compareTo(elements[i]) < 0) {
      return false;
    }
    if (right < elements.length && elements[right].compareTo(elements[i]) < 0) {
      return false;
    }
  }
  return true;
}

bool isMinHeap(List<int> list) {
  Heap heap = Heap(elements: [...list], priority: Priority.min);
  return heap.elements.toString() == list.toString();
}

Heap? combineTwoHeaps(Heap heap1, Heap heap2) {
  if (heap1.priority != heap2.priority) return null;
  Heap heap = Heap(
      elements: [...heap1.elements, ...heap2.elements],
      priority: heap1.priority);

  return heap;
}

int? findKthSmallest(List<int> nums, int k) {
  var heap = Heap(
    elements: nums,
    priority: Priority.min,
  );
  int? value;
  for (int i = 0; i < k; i++) {
    value = heap.remove();
  }
  return value;
}

int findKthLargest(List<int> nums, int k) {
  var heap = Heap(elements: nums);
  int? value;
  for (int i = 0; i < k; i++) {
    value = heap.remove();
  }
  return value ?? 0;
}

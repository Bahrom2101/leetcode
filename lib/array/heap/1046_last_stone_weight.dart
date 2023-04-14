import 'package:leetcode/structures/queue.dart';

void main() {
  print(lastStoneWeight([2, 7, 4, 1, 8, 1, 3]));
  // print(lastStoneWeight([4,1,2,1,1]));
}

int lastStoneWeight(List<int> stones) {
  // Use a priority queue to keep the stones sorted by weight
  var queue = PriorityQueue<int>(elements: stones);

  // Keep smashing stones together until there's at most one left
  while (queue.length > 1) {
    var x = queue.dequeue()!;
    var y = queue.dequeue()!;
    if (x != y) {
      queue.enqueue((y - x).abs());
    }
  }

  // Return the last stone's weight, or 0 if there are no stones left
  return queue.isEmpty ? 0 : queue.peek!;
}

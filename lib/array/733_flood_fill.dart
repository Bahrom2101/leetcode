import 'dart:collection';

void main() {
  print(floodFill(
    [
      [3, 1, 1, 3, 1],
      [1, 2, 1, 1, 1],
      [1, 2, 1, 2, 0],
      [1, 3, 1, 2, 1],
      [2, 1, 1, 0, 1],
    ],
    2,
    2,
    4,
  ));
}

List<List<int>> floodFill(List<List<int>> image, int sr, int sc, int color) {
  int m = image.length, n = image[0].length;
  int startColor = image[sr][sc];
  if (startColor == color) return image;

  Queue<List<int>> queue = Queue();
  queue.add([sr, sc]);

  while (queue.isNotEmpty) {
    List<int> curr = queue.removeFirst();
    int row = curr[0], col = curr[1];
    if (image[row][col] == startColor) {
      image[row][col] = color;
      if (row > 0) queue.add([row - 1, col]);
      if (row < m - 1) queue.add([row + 1, col]);
      if (col > 0) queue.add([row, col - 1]);
      if (col < n - 1) queue.add([row, col + 1]);
    }
  }

  return image;
}
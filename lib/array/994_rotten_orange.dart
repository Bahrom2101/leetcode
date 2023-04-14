import 'dart:collection';

void main() {
  print(orangesRotting([
    [0]
  ]));
}

int orangesRotting(List<List<int>> grid) {
  int rows = grid.length;
  int cols = grid[0].length;

  // Initialize queue for BFS
  Queue<Point> queue = Queue<Point>();
  int freshOranges = 0;

  // Add all rotten oranges to the queue and count fresh oranges
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[i][j] == 2) {
        queue.add(Point(i, j));
      } else if (grid[i][j] == 1) {
        freshOranges++;
      }
    }
  }

  // If there are no fresh oranges initially, return 0
  if (freshOranges == 0) {
    return 0;
  }

  int minutes = 0;
  List<List<int>> directions = [[-1, 0], [0, 1], [1, 0], [0, -1]];

  while (queue.isNotEmpty) {
    int size = queue.length;

    for (int i = 0; i < size; i++) {
      Point curr = queue.removeFirst();

      for (List<int> dir in directions) {
        int newRow = curr.row + dir[0];
        int newCol = curr.col + dir[1];

        if (newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols) {
          continue;
        }

        if (grid[newRow][newCol] == 1) {
          grid[newRow][newCol] = 2;
          freshOranges--;
          queue.add(Point(newRow, newCol));
        }
      }
    }

    if (queue.isNotEmpty) {
      minutes++;
    }
  }

  return freshOranges == 0 ? minutes : -1;
}

class Point {
  int row;
  int col;

  Point(this.row, this.col);
}

int orangesRotting1(List<List<int>> grid) {
  int sr = 0;
  int sc = 0;
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == 2) {
        sr = i;
        sc = j;
        break;
      }
    }
  }
  int m = grid.length,
      n = grid[0].length;

  Queue<List<int>> queue = Queue();
  queue.add([sr, sc]);
  int color = 2;

  // index, color
  Map<String, int> map = {};

  while (queue.isNotEmpty) {
    List<int> curr = queue.removeFirst();
    int row = curr[0],
        col = curr[1];
    if (grid[row][col] == 1 || grid[row][col] == 2) {
      if (map['$row,$col'] == null) {
        map['$row,$col'] = color;
        grid[row][col] = color;
        color++;
      } else {
        grid[row][col] = map['$row,$col']!;
        color--;
      }
      if (row > 0) queue.add([row - 1, col]);
      if (row < m - 1) queue.add([row + 1, col]);
      if (col > 0) queue.add([row, col - 1]);
      if (col < n - 1) queue.add([row, col + 1]);
    }
  }
  for (var element in grid) {
    print(element);
  }
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == 1) {
        return -1;
      }
    }
  }
  print('color: $color');
  return color - 3;
}

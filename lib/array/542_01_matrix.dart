import 'dart:collection';

void main() {
  var matrix = updateMatrix([
    [1, 1, 1, 1, 0, 1, 1, 1],
    [1, 1, 1, 1, 0, 1, 0, 1],
    [1, 1, 1, 1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 1, 0],
  ]);
  for (var element in matrix) {
    print(element);
  }
}

List<List<int>> updateMatrix(List<List<int>> mat) {
  int m = mat.length, n = mat[0].length;
  List<List<int>> dist = List.generate(m, (i) => List.filled(n, 0));

  // Initialize queue with all 0s and set their distance to 0
  Queue<List<int>> q = Queue();
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (mat[i][j] == 0) {
        dist[i][j] = 0;
        q.add([i, j]);
      } else {
        dist[i][j] = -1;
      }
    }
  }

  // BFS to find nearest 0 for each cell
  int dirs = 4;
  List<int> dx = [-1, 0, 1, 0];
  List<int> dy = [0, 1, 0, -1];

  while (q.isNotEmpty) {
    List<int> curr = q.removeFirst();
    int x = curr[0], y = curr[1];

    for (int d = 0; d < dirs; d++) {
      int nx = x + dx[d];
      int ny = y + dy[d];
      if (nx >= 0 && nx < m && ny >= 0 && ny < n && dist[nx][ny] == -1) {
        dist[nx][ny] = dist[x][y] + 1;
        q.add([nx, ny]);
      }
    }
  }

  return dist;
}

List<List<int>> updateMatrix1(List<List<int>> mat) {
  Queue<List<int>> q = Queue();
  int lenRow = mat.length, lenCol = mat[0].length;
  bool isSafe(r, c) {
    return 0 <= r && r <= lenRow - 1 && 0 <= c && c <= lenCol - 1;
  }

  for (var i = 0; i < mat.length; i++) {
    for (var j = 0; j < mat[0].length; j++) {
      if (mat[i][j] == 0) {
        q.add([i, j]);
      } else {
        mat[i][j] = -1;
      }
    }
  }
  while (q.isNotEmpty) {
    var p = q.removeFirst();
    for (var i in [
      [p[0], p[1] + 1],
      [p[0], p[1] - 1],
      [p[0] - 1, p[1]],
      [p[0] + 1, p[1]]
    ]) {
      if (isSafe(i[0], i[1]) && mat[i[0]][i[1]] == -1) {
        mat[i[0]][i[1]] = mat[p[0]][p[1]] + 1;
        q.add([i[0], i[1]]);
      }
    }
  }
  return mat;
}

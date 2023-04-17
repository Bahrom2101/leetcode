void main() {
  print(spiralOrder([
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20]
  ]));
}

List<int> spiralOrder(List<List<int>> matrix) {
  if (matrix.isEmpty) return [];

  int top = 0;
  int bottom = matrix.length - 1;
  int left = 0;
  int right = matrix[0].length - 1;
  List<int> spiralList = [];

  while (top <= bottom && left <= right) {
    // Traverse Right
    for (int i = left; i <= right; i++) {
      spiralList.add(matrix[top][i]);
    }
    top++;

    // Traverse Down
    for (int i = top; i <= bottom; i++) {
      spiralList.add(matrix[i][right]);
    }
    right--;

    if (top <= bottom) {
      // Traverse Left
      for (int i = right; i >= left; i--) {
        spiralList.add(matrix[bottom][i]);
      }
      bottom--;
    }

    if (left <= right) {
      // Traverse Up
      for (int i = bottom; i >= top; i--) {
        spiralList.add(matrix[i][left]);
      }
      left++;
    }
  }

  return spiralList;
}

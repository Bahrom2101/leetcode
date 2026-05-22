void main() {
  print(isValidSudoku([
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ]));
}

bool isValidSudoku(List<List<String>> board) {
  var rows = List.generate(9, (_) => List.filled(9, false));
  var cols = List.generate(9, (_) => List.filled(9, false));
  var boxes = List.generate(9, (_) => List.filled(9, false));

  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (board[i][j] != '.') {
        int num = int.parse(board[i][j]) - 1;
        int boxIndex = (i ~/ 3) * 3 + (j ~/ 3);
        if (rows[i][num] || cols[j][num] || boxes[boxIndex][num]) {
          return false;
        }

        rows[i][num] = cols[j][num] = boxes[boxIndex][num] = true;
      }
    }
  }
  return true;
}

void main() {
  print(isValidSudoku([
    ["5", "8", ".", ".", "7", ".", ".", ".", "."],
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
  for (int i = 0; i < board.length; i++) {
    Set<String> vector = {};
    int vectorNumbers = 0;
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] != '.') {
        vectorNumbers++;
        vector.add(board[i][j]);
      }
    }
    if (vectorNumbers != vector.length) return false;
    vectorNumbers = 0;
    vector.clear();
    for (int n = 0; n < board[i].length; n++) {
      if (board[n][i] != '.') {
        vectorNumbers++;
        vector.add(board[n][i]);
      }
    }
    if (vectorNumbers != vector.length) return false;
  }
  return true;
}

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
  List<Set<String>> blocks = []; // 3x3 squares
  for (int r = 0; r < board.length; r += 3) {
    for (int c = 0; c < board[r].length; c += 3) {
      Set<String> block = {};

      int vectorNumbers = 0;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[r + i][c + j] != '.') {
            vectorNumbers++;
            block.add(board[r + i][c + j]);
          }
        }
      }
      if (vectorNumbers != block.length) return false;
      blocks.add(block);
    }
  }
  return true;
}

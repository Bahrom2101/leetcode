void main() {
  var board = [
    /*        0    1    2    3    4    5    6    7    8      */
    /* 0 */ ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    /* 1 */ ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    /* 2 */ [".", "9", "8", ".", "5", ".", ".", "6", "."],
    /* 3 */ ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    /* 4 */ ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    /* 5 */ ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    /* 6 */ [".", "6", ".", ".", ".", ".", "2", "8", "."],
    /* 7 */ [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    /* 8 */ [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];

  Solution().solveSudoku(board);
  // print(board);
}

class Solution {
  void solveSudoku(List<List<String>> board) {
    backtracking(board);
    print(board);
  }

  bool backtracking(List<List<String>> board) {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (board[row][col] == '.') {
          for (int n = 1; n < 10; n++) {
            if (canBePlaced(board, row, col, n.toString())) {
              board[row][col] = n.toString();
              if (backtracking(board)) return true;
              board[row][col] = '.';
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool canBePlaced(List<List<String>> board, int row, int col, String num) {
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == num) return false; // row check
      if (board[i][col] == num) return false; // column check

      // 3x3 box check
      int boxRow = 3 * (row ~/ 3) + i ~/ 3;
      int boxCol = 3 * (col ~/ 3) + i % 3;
      if (board[boxRow][boxCol] == num) return false;
    }
    return true;
  }
}

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
  for (var item in board) {
    print(item);
  }
}

class Solution {
  void solveSudoku(List<List<String>> board) {
    List<Set<String>> rows = [];
    List<Set<String>> columns = [];
    List<Set<String>> blocks = []; // 3x3 squares

    for (int i = 0; i < board.length; i++) {
      Set<String> row = {};
      Set<String> column = {};
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] != '.') {
          row.add(board[i][j]);
        }
        if (board[j][i] != '.') {
          column.add(board[j][i]);
        }
      }
      rows.add(row);
      columns.add(column);
    }
    for (int r = 0; r < board.length; r += 3) {
      for (int c = 0; c < board[r].length; c += 3) {
        Set<String> block = {};
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            if (board[r + i][c + j] != '.') {
              block.add(board[r + i][c + j]);
            }
          }
        }
        blocks.add(block);
      }
    }
    changeCells(board, rows, columns, blocks);
  }

  void changeCells(
    List<List<String>> board,
    List<Set<String>> rows,
    List<Set<String>> columns,
    List<Set<String>> blocks,
  ) {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == '.') {
          var blockNumber = defineBlock(i, j);
          var row = rows[i];
          var col = columns[j];
          var block = blocks[blockNumber - 1];
          print('row: $row');
          print('col: $col');
          print('block: $block');
          for (int d = 1; d <= 9; d++) {
            print('d: $d');
            print('canReplace: ${canReplace(d, row, col, block)}');
            if (canReplace(d, row, col, block)) {
              board[i][j] = d.toString();
              row.add(d.toString());
              col.add(d.toString());
              block.add(d.toString());
              break;
            } else {
              print('else d: $d');
            }
          }
        }
      }
    }
  }

  bool canReplace(int d, Set<String> row, Set<String> col, Set<String> block) {
    if (row.contains(d.toString()) ||
        col.contains(d.toString()) ||
        block.contains(d.toString())) {
      return false;
    } else {
      return true;
    }
  }

  int defineBlock(int i, int j) {
    if (i < 3) {
      if (j < 3) return 1;
      if (j >= 3 && j < 6) return 2;
      if (j >= 6 && j < 9) return 3;
    }
    if (i >= 3 && i < 6) {
      if (j < 3) return 4;
      if (j >= 3 && j < 6) return 5;
      if (j >= 6 && j < 9) return 6;
    } else if (i >= 6 && i < 9) {
      if (j < 3) return 7;
      if (j >= 3 && j < 6) return 8;
      if (j >= 6 && j < 9) return 9;
    }
    return 0;
  }
}

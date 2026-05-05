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
}

class Solution {
  late List<List<String>> board;
  List<Set<String>> rows = List.generate(9, (e) => <String>{});
  List<Set<String>> columns = List.generate(9, (e) => <String>{});
  List<Set<String>> boxes = List.generate(9, (e) => <String>{}); // 3x3 squares

  bool changeCells(int r) {
    int i = r ~/ 9;
    int j = r % 9;
    if (i == 81) return true;
    if (board[i][j] != '.') return changeCells(r + 1);

    var blockNumber = i ~/ 3 * 3 + j ~/ 3;
    for (int d = 1; d <= 9; d++) {
      if (!canReplace(d, rows[i], columns[j], boxes[blockNumber])) continue;
      board[i][j] = d.toString();
      rows[i].add(d.toString());
      columns[j].add(d.toString());
      boxes[blockNumber].add(d.toString());

      if (changeCells(r + 1)) return true;

      board[i][j] = '.';
      rows[i].remove(d);
      columns[j].remove(d);
      boxes[blockNumber].remove(d);
    }
    return false;
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

  void solveSudoku(List<List<String>> board) {
    this.board = board;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] != '.') {
          rows[i].add(board[i][j]);
          boxes[i ~/ 3 * 3 + j ~/ 3].add(board[i][j]);
        }
        if (board[j][i] != '.') {
          columns[i].add(board[j][i]);
        }
      }
    }

    changeCells(0);
    for (var e in board) {
      print(e);
    }
  }
}

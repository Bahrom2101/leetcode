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
  void solveSudoku(List<List<String>> board) {
    final rUsed = List.generate(9, (_) => <int>{});
    final cUsed = List.generate(9, (_) => <int>{});
    final sUsed = List.generate(9, (_) => <int>{});

    bool solve(int i) {
      if (i == 81) return true;

      final r = i ~/ 9;
      final c = i % 9;
      if (board[r][c] != '.') return solve(i + 1);

      final s = r ~/ 3 * 3 + c ~/ 3;
      for (var d = 1; d <= 9; ++d) {
        if (rUsed[r].contains(d)) continue;
        if (cUsed[c].contains(d)) continue;
        if (sUsed[s].contains(d)) continue;

        board[r][c] = d.toString();
        rUsed[r].add(d);
        cUsed[c].add(d);
        sUsed[s].add(d);

        if (solve(i + 1)) return true;

        board[r][c] = '.';
        rUsed[r].remove(d);
        cUsed[c].remove(d);
        sUsed[s].remove(d);
      }
      return false;
    }

    for (var r = 0; r < 9; ++r) {
      for (var c = 0; c < 9; ++c) {
        final d = board[r][c].codeUnitAt(0) - 48;
        if (d < 0) continue;
        rUsed[r].add(d);
        cUsed[c].add(d);
        sUsed[r ~/ 3 * 3 + c ~/ 3].add(d);
      }
    }
    print(sUsed);

    solve(0);
  }
}

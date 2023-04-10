void main() {
  print(uniquePaths(3, 7));
}

int uniquePaths(int m, int n) {
  List<List<int>> dp = List.generate(m, (_) => List.filled(n, 1));
  for (int i = 1; i < m; i++) {
    for (int j = 1; j < n; j++) {
      dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
    }
    print(dp[i]);
  }
  return dp[m - 1][n - 1];
}

int uniquePaths1(int m, int n) {
  int paths = 0;
  int x = 1;
  int y = 1;
  paths = _path(m, n, x, y, paths);
  return paths;
}

int _path(int m, int n, int x, int y, int count) {
  if (x == m && y == n) {
    return count + 1;
  }
  if (x < m) {
    count = _path(m, n, x + 1, y, count);
  }
  if (y < n) {
    count = _path(m, n, x, y + 1, count);
  }
  return count;
}

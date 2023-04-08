void main() {
  print(numIslands([
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"]
  ]));
  print(numIslands([
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"]
  ]));
}

int numIslands(List<List<String>> grid) {
  int count = 0;
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == '1') {
        // found new island
        count++;
        dfs(grid, i, j); // visit all adjacent cells
      }
    }
  }
  return count;
}

void dfs(List<List<String>> grid, int i, int j) {
  if (i < 0 ||
      i >= grid.length ||
      j < 0 ||
      j >= grid[i].length ||
      grid[i][j] == '0') {
    return;
  }
  grid[i][j] = '0'; // mark current cell as visited
  dfs(grid, i + 1, j); // visit adjacent cells
  dfs(grid, i - 1, j);
  dfs(grid, i, j + 1);
  dfs(grid, i, j - 1);
}

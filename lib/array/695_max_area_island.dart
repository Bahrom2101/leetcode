void main() {
  print(maxAreaOfIsland([
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]
  ]));
}

int maxAreaOfIsland(List<List<int>> grid) {
  int visited = 2;
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == 1) {
        // found new island
        dfs(grid, i, j, visited); // visit all adjacent cells
        visited++;
      }
    }
  }
  Map<int, int> map = {};
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] > 0) {
        map[grid[i][j]] = (map[grid[i][j]] ?? 0) + 1;
      }
    }
  }
  int maxArea = 0;
  for (var element in map.values) {
    if (element > maxArea) {
      maxArea = element;
    }
  }
  return maxArea;
}

void dfs(List<List<int>> grid, int i, int j, int visited) {
  if (i < 0 ||
      i >= grid.length ||
      j < 0 ||
      j >= grid[i].length ||
      grid[i][j] != 1) {
    return;
  }
  grid[i][j] = visited; // mark current cell as visited
  dfs(grid, i + 1, j, visited); // visit adjacent cells
  dfs(grid, i - 1, j, visited);
  dfs(grid, i, j + 1, visited);
  dfs(grid, i, j - 1, visited);
}

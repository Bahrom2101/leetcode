void main() {
  var sol = Solution();
  // print(
  // sol.combine(4, 2)); // [1,2,3,4] -> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
  print(sol.combine(5, 3));
}

class Solution {
  List<List<int>> combinations = [];

  List<List<int>> combine(int n, int k) {
    backtracking(n, k, 1, []);
    return combinations;
  }

  void backtracking(int n, int k, int start, List<int> current) {
    if (current.length == k) {
      combinations.add([...current]);
      return;
    }

    for (int i = start; i <= n; i++) {
      current.add(i);
      backtracking(n, k, i + 1, current);
      current.removeLast();
    }
  }
}

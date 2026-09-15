void main() {
  var solution = Solution();
  print(solution.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
  //[1,1,6], [1,2,5], [1,7], [2,6]
  // print(Solution().combinationSum2([2, 5, 2, 1, 2], 5));
  // print(Solution().combinationSum2([2, 3], 5));
}

class Solution {
  List<List<int>> combinations = [];
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    candidates.sort();
    backtracking(candidates, target, 0, []);
    return combinations;
  }

  void backtracking(
    List<int> candidates,
    int target,
    int start,
    List<int> current,
  ) {
    if (target == 0) {
      combinations.add([...current]);
      return;
    }
    for (int i = start; i < candidates.length; i++) {
      if (i > start && candidates[i] == candidates[i - 1]) continue;
      if (candidates[i] <= target) {
        current.add(candidates[i]);
        backtracking(candidates, target - candidates[i], i + 1, current);
        current.removeLast();
      }
    }
  }
}

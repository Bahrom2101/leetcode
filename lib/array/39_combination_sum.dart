void main() {
  print(Solution().combinationSum([2, 3, 6, 7], 7)); // [[2,2,3],[7]]
  // print(Solution().combinationSum([2, 3, 5], 8)); // [[2,2,2,2],[2,3,3],[3,5]]
}

class Solution {
  List<List<int>> combinations = [];
  List<List<int>> combinationSum(List<int> candidates, int target) {
    backtrack(candidates..sort(), target, 0, []);
    return combinations;
  }

  void backtrack(
      List<int> candidates, int target, int start, List<int> current) {
    if (target == 0) {
      combinations.add([...current]);
      return;
    }
    for (int i = start; i < candidates.length; i++) {
      if (candidates[i] <= target) {
        current.add(candidates[i]);
        backtrack(candidates, target - candidates[i], i, current);
        current.removeLast();
      }
    }
  }
}

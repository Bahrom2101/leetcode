void main() {
  [
    [2, 2, 2, 2, 2, 2, 2, 2, 2, 2], // 20 = 2 * 10 + 3 * 0
    [2, 2, 2, 2, 2, 2, 2, 3, 3], // 20 = 2 * 7 + 3 * 2
    [2, 2, 2, 2, 3, 3, 3, 3], // 20 = 2 * 4 + 3 * 4
    [2, 3, 3, 3, 3, 3, 3] // 20 = 2 * 1 + 3 * 6
  ];
  print(Solution().combinationSum([8, 3, 7, 4], 11));
  // print(Solution().combinationSum([2, 3, 5], 10));
  // print(Solution().combinationSum([2, 3, 6, 7], 7)); // [[2,2,3],[7]]
  // print(Solution().combinationSum([2, 3, 5], 8)); // [[2,2,2,2],[2,3,3],[3,5]]
}

class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    Set<String> combinations = {};
    for (int i = 0; i < candidates.length; i++) {
      int varI = candidates[i];
      for (int j = 0; j <= i; j++) {
        int varJ = candidates[j];
        int countDown = target;
        while (countDown > 0) {
          var sub = countDown - varJ;
          if (sub >= 0 && sub % varI == 0) {
            List<String> list = [
              ...List.generate(sub ~/ varI, (_) => varI.toString()),
              ...List.generate((target - sub) ~/ varJ, (_) => varJ.toString())
            ];
            combinations.add(list.join(','));
          }
          countDown -= varJ;
        }
      }
    }
    return combinations
        .map((e) => e.split(',').map(int.parse).toList())
        .toList();
  }
}

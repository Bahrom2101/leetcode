void main() {
  [
    [2, 2, 2, 2, 2, 2, 2, 2, 2, 2], // 20 = 2 * 10 + 3 * 0
    [2, 2, 2, 2, 2, 2, 2, 3, 3], // 20 = 2 * 7 + 3 * 2
    [2, 2, 2, 2, 3, 3, 3, 3], // 20 = 2 * 4 + 3 * 4
    [2, 3, 3, 3, 3, 3, 3] // 20 = 2 * 1 + 3 * 6
  ];
  // print(Solution().combinationSum([8, 3, 7, 4], 11));
  print(Solution().combinationSum([2, 3], 8));
  // print(Solution().combinationSum([2, 3, 6, 7], 7)); // [[2,2,3],[7]]
  // print(Solution().combinationSum([2, 3, 5], 8)); // [[2,2,2,2],[2,3,3],[3,5]]
}

class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    Set<String> combinations = {};

    void build(int start, int remaining, List<int> current) {
      if (remaining == 0) {
        combinations.add(current.join(','));
        return;
      }

      for (int i = start; i < candidates.length; i++) {
        int val = candidates[i];

        if (val > remaining) continue;

        current.add(val);
        build(i, remaining - val, current); // reuse allowed
        current.removeLast();
      }
    }

    build(0, target, []);

    return combinations
        .map((e) => e.split(',').map(int.parse).toList())
        .toList();
  }
}

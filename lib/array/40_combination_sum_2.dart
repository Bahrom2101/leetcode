void main() {
  print(Solution().combinationSum2([10,1,2,7,6,1,5], 8)); //[1,1,6], [1,2,5], [1,7], [2,6]
}

class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
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

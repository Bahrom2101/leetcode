void main() {
  var sol = Solution();
  print(sol.subsets([1, 2, 3])); // [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

  var iterativeSol = IterativeSolution();
  print(iterativeSol.subsets([1, 2, 3]));
}

class Solution {
  List<List<int>> uniqueSet = [];

  List<List<int>> subsets(List<int> nums) {
    backtracking(nums, 0, []);
    return uniqueSet;
  }

  void backtracking(List<int> numbers, int start, List<int> current) {
    uniqueSet.add([...current]);

    for (int i = start; i < numbers.length; i++) {
      current.add(numbers[i]);
      backtracking(numbers, i + 1, current);
      current.removeLast();
    }
  }
}

class IterativeSolution {
  List<List<int>> subsets(List<int> nums) {
    var result = [<int>[]];
    for (var num in nums) {
      var size = result.length;
      for (var i = 0; i < size; i++) {
        result.add([...result[i], num]);
      }
    }
    return result;
  }
}

void main(List<String> args) {
  print(Solution().letterCombinations('23'));
  // abc def ghi -> adg, adh, adi, aeg, aeh, aei, afg, afh, afi,
}

class Solution {
  Map<String, List<String>> digitMap = {
    '2': ['a', 'b', 'c'],
    '3': ['d', 'e', 'f'],
    '4': ['g', 'h', 'i'],
    '5': ['j', 'k', 'l'],
    '6': ['m', 'n', 'o'],
    '7': ['p', 'q', 'r', 's'],
    '8': ['t', 'u', 'v'],
    '9': ['w', 'x', 'y', 'z'],
  };
  List<String> combinations = [];

  List<String> letterCombinations(String digits) {
    backtracking(digits, 0, []);
    return combinations;
  }

  void backtracking(String digits, int digintIndex, List<String> current) {
    print(current);
    if (digits.length == digintIndex) {
      combinations.add(current.join());
      return;
    }
    var letters = digitMap[digits[digintIndex]]!;
    for (var l in letters) {
      current.add(l);
      backtracking(digits, digintIndex + 1, current);
      current.removeLast();
    }
  }
}

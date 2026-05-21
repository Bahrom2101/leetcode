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

List<String> letterCombinations(String digits) {
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
  int combinationsCount = 1;
  for (int i = 0; i < digits.length; i++) {
    combinationsCount *= digitMap[digits[i]]!.length;
  }
  List<String> letters = [];

  return letters;
}

final Map<String, String> chars = {
  '2': 'abc',
  '3': 'def',
  '4': 'ghi',
  '5': 'jkl',
  '6': 'mno',
  '7': 'pqrs',
  '8': 'tuv',
  '9': 'wxyz'
};
List<String> letterCombinations1(String digits) {
  if (digits.length == 0) return [];

  final firstDigit = digits[0];
  final charsInDigit = chars[firstDigit] ?? "";
  if (digits.length == 1) return charsInDigit.split("");

  final allCombinations = List<String>.empty(growable: true);
  final rest = digits.substring(1);
  final combinationsWithoutFirst = letterCombinations(rest);

  for (int i = 0; i < charsInDigit.length; i++) {
    for (int j = 0; j < combinationsWithoutFirst.length; j++) {
      allCombinations.add("${charsInDigit[i]}${combinationsWithoutFirst[j]}");
    }
  }

  return allCombinations;
}

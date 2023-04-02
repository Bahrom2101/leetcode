void main(List<String> args) {
  print(letterCombinations('278'));
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

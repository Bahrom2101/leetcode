import 'package:leetcode/math/20_valid_parantheses.dart';

void main() {
  // print(longestValidParentheses("(()()())"));
  print(longestValidParentheses("()((())()"));
}

int longestValidParentheses(String s) {
  Map<int, String> leftMap = {};
  Map<int, String> rightMap = {};
  Map<int, String> parantheses = {};

  for (int i = 0; i < s.length; i++) {
    // if (s[i] == '(') {
    //   for (int j = i; j < s.length; j++) {
    //     bool canBeCouple = (i % 2 == 0 && j % 2 == 1 || i % 2 == 1 && j % 2 == 0) && (i - j) < 2;
    //     if (s[j] == ')' && canBeCouple && !parantheses.containsKey(j)) {
    //       parantheses[i] = s[i];
    //       parantheses[j] = s[j];
    //     }
    //   }
    // }
    if (s[i] == '(') {
      leftMap[i] = s[i];
    } else {
      rightMap[i] = s[i];
    }
  }

  leftMap.forEach((key, value) {
    print('my log: key: $key');
    print('my log: rightMap: $rightMap');
    if (key % 2 == 0 && rightMap.length > 2) {
      int index = rightMap.keys.firstWhere((e) => e % 1 == 0);
      print('index here: $index');
      parantheses[key] = value;
      parantheses[index] = rightMap[index] ?? '';
      rightMap.remove(index);
    } else if (key % 1 == 0 && rightMap.isNotEmpty) {
      int index = rightMap.keys.firstWhere((e) => e % 2 == 0);
      print('index there: $index');
      parantheses[key] = value;
      parantheses[index] = rightMap[index] ?? '';
      rightMap.remove(index);
    }
  });
  print('my log parantheses: $parantheses');
  print('my log: ${isValid(parantheses.values.join())}');
  return parantheses.length;
}

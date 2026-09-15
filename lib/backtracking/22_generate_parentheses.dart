import 'dart:math';

void main(List<String> args) {
  print(generateParenthesis3(3));
}

List<String> generateParenthesis(int n) {
  int countOfPossibleCombinations = pow(2, 2 * n - 1).toInt();
  List<String> combinations = [];
  List<String> c = List.filled(countOfPossibleCombinations, '');
  int changingCount = 1;
  for (int i = 0; i < 2 * n; i++) {
    int index = 0;
    for (int j = 0; j < countOfPossibleCombinations; j++) {
      c[index] = (j ~/ changingCount % 2 == 0 ? '(' : ')') + c[index];
      index = index == (2 * n - 1) ? 0 : (index + 1);
    }
    changingCount *= 2;
  }
  for (int i = 0; i < c.length; i++) {
    if (isValid(c[i])) {
      combinations.add(c[i]);
    }
  }
  return combinations;
}

List<String> generateParenthesis1(int n) {
  int countOfPossibleCombinations = pow(2, 2 * n - 1).toInt();
  print(countOfPossibleCombinations);
  List<String> combinations = [];
  int changingCount = 1;
  String all = '';
  for (int i = 0; i < 2 * n; i++) {
    for (int j = 0; j < countOfPossibleCombinations; j++) {
      all += j ~/ changingCount % 2 == 0 ? '(' : ')';
    }
    changingCount *= 2;
  }
  for (int i = 0; i < countOfPossibleCombinations; i++) {
    String s = '';
    for (int j = 0; j < 2 * n; j++) {
      s = all[i + j * countOfPossibleCombinations] + s;
    }
    if (isValid(s)) {
      combinations.add(s);
    }
  }
  return combinations;
}

List<String> generateParenthesis2(int n) {
  List<String> combinations = [];
  generateAll(List.filled(2 * n, ''), 0, combinations);
  return combinations;
}

void generateAll(List<String> current, int pos, List<String> result) {
  if (pos == current.length) {
    if (valid(current)) result.add(current.join());
  } else {
    current[pos] = '(';
    generateAll(current, pos + 1, result);
    current[pos] = ')';
    generateAll(current, pos + 1, result);
  }
}

bool valid(List<String> current) {
  int balance = 0;
  for (int i = 0; i < current.length; i++) {
    current[i] == '(' ? balance++ : balance--;
    if (balance < 0) return false;
  }
  return balance == 0;
}

List<String> generateParenthesis3(int n) {
  List<String> ans = [];
  if (n == 0) {
    ans.add('');
  } else {
    for (int c = 0; c < n; ++c) {
      for (String left in generateParenthesis3(c)) {
        for (String right in generateParenthesis3(n - 1 - c)) {
          ans.add('($left)$right');
        }
      }
    }
  }
  return ans;
}

bool isValid(String s) {
  int balance = 0;
  for (int i = 0; i < s.length; i++) {
    s[i] == '(' ? balance++ : balance--;
    if (balance < 0) return false;
  }
  return balance == 0;
}

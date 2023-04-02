void main(List<String> args) {
  print(isValid(''));
}

bool isValid(String s) {
  List<String> stack = [];
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(' || s[i] == '{' || s[i] == '[') {
      stack.add(s[i]);
    } else {
      if (stack.isEmpty) {
        return false;
      }
      final last = stack.last;
      if (last == '(' && s[i] != ')' ||
          last == '{' && s[i] != '}' ||
          last == '[' && s[i] != ']') {
        return false;
      }
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

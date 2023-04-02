void main(List<String> args) {
  print(minAddToMakeValid('()))(('));
}

int minAddToMakeValid(String s) {
  int count = 0;
  List<String> stack = [];
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(') {
      stack.add(s[i]);
    } else {
      if (stack.isEmpty) {
        count++;
      } else {
        final last = stack.last;
        if (last != '(') {
          count++;
        }
        stack.removeLast();
      }
    }
  }
  return count + stack.length;
}

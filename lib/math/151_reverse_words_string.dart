void main(List<String> args) {
  print(('hello  world').length);
  print(reverseWords('hello  world'));
  print(reverseWords('hello  world').length);
}

String reverseWords(String s) {
  String reversed = '';
  String buffer = '';
  for (int i = s.length - 1; i >= 0; i--) {
    if (i > 0 && s[i] == ' ' && s[i - 1] == ' ') {
      continue;
    }
    if (s[i] != ' ') {
      buffer = s[i] + buffer;
    } else {
      reversed += ' $buffer';
      buffer = '';
    }
  }
  if(buffer.isNotEmpty) {
    reversed += ' $buffer';
  }
  return reversed.trim();
}

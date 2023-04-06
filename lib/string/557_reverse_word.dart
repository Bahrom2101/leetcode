void main() {
  print(("Let's take LeetCode contest").length);
  print(reverseWords("Let's take LeetCode contest"));
}

String reverseWords(String s) {
  String buffer = '';
  StringBuffer temp = StringBuffer();
  s = ' $s';
  for (int i = s.length - 1; i >= 0; i--) {
    if(s[i] != ' ') {
      temp.write(s[i]);
    } else {
      buffer = buffer.isNotEmpty ? '$temp $buffer' : '$temp';
      temp.clear();
    }
  }
  return buffer;
}

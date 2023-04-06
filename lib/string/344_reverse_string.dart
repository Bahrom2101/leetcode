void main(List<String> args) {
  reverseString(['a', 'f', 'w', 'e', 'v']);
}

void reverseString(List<String> s) {
  recursiveArray(s.length - 1, s);
  print(s);
}

void recursiveArray(int index, List<String> s) {
  if (index < s.length / 2) {
    return;
  }
  String temp = s[index];
  s[index] = s[s.length - index - 1];
  s[s.length - index - 1] = temp;
  recursiveArray(index - 1, s);
}

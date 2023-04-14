void main() {
  //                      0123456
  print(lengthOfLastWord(' world  '));
  print(lengthOfLastWord(' fly me   to   the moon '));
}

int lengthOfLastWord(String s) {
  s = ' $s ';
  int left = 0;
  int right = 0;
  for (int i = s.length - 2; i > 0; i--) {
    if (s[i] != ' ') {
      if (s[i + 1] == ' ') {
        right = i;
      }
    } else if (right > 0) {
      left = i;
      break;
    }
  }
  return right - left;
}

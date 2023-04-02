void main(List<String> args) {
  print(longestPalindrome('sdjbjhdfgjhg'));
}

String longestPalindrome(String s) {
  
  return '';
}

bool isPolindrome(String s) {
  bool polindrome = true;
  int i = 0;
  while (i < s.length) {
    if (s[i] != s[s.length - i - 1]) {
      polindrome = false;
      break;
    }
    i++;
  }
  return polindrome;
}

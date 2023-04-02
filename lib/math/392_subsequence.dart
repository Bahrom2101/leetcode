void main() {
  print(isSubsequence('abc', 'ahbgdc'));
  print(isSubsequence('axc', 'ahbgdc'));
  print(isSubsequence('', 'abc'));
}

bool isSubsequence(String s, String t) {
  if (s.isEmpty) return true;
  int indexS = 0;
  for (int i = 0; i < t.length; i++) {
    if (t[i] == s[indexS]) {
      indexS++;
      if (indexS == s.length) {
        return true;
      }
    }
  }
  return false;
}

void main() {
  print('0'.codeUnitAt(0));
  print('9'.codeUnitAt(0));
  print(isPalindrome('A man, a plan, a canal: Panama'));
}

bool isPalindrome(String s) {
  int left = 0;
  int right = s.length - 1;
  while (left < right) {
    if (!isNonAlphanumeric(s[left])) {
      left++;
      continue;
    }
    if (!isNonAlphanumeric(s[right])) {
      right--;
      continue;
    }
    if (s[left].toLowerCase() != s[right].toLowerCase()) {
      return false;
    }
    left++;
    right--;
  }

  return true;
}

bool isNonAlphanumeric(String char) {
  if (char.codeUnitAt(0) > 64 && char.codeUnitAt(0) < 91 ||
      char.codeUnitAt(0) > 96 && char.codeUnitAt(0) < 123 ||
      char.codeUnitAt(0) > 47 && char.codeUnitAt(0) < 58) {
    return true;
  }
  return false;
}

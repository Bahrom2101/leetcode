void main() {
  print(strStr('sabutsad', 'sad'));
}

int strStr(String haystack, String needle) {
  if (needle.isEmpty) {
    return 0;
  }
  int n = haystack.length;
  int m = needle.length;
  for (int i = 0; i < n - m + 1; i++) {
    bool found = true;
    for (int j = 0; j < m; j++) {
      if (haystack[i + j] != needle[j]) {
        found = false;
        break;
      }
    }
    if (found) {
      return i;
    }
  }
  return -1;
}

bool match(List<int> one, List<int> two) {
  for (int i = 0; i < 26; i++) {
    if (one[i] != two[i]) return false;
  }
  return true;
}

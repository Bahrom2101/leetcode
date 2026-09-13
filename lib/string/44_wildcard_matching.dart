void main() {
  // print(Solution().isMatch('dctka', '?*ka'));
  print(Solution().isMatch('cb', '?a'));
}

class Solution {
  bool isMatch(String s, String p) {
    bool match = true;
    Map<String, String> symbolMap = {};

    int i = 0;
    int j = 0;

    while (i < s.length && j < p.length) {
      if (p[i] == '?') {
        if (symbolMap['?'] != null && symbolMap['?'] != s[i]) {
          match = false;
          break;
        }
        symbolMap['?'] = s[j];
      } else if (p[i] == '*') {
        symbolMap['*'] = (symbolMap['*'] ?? '') + s[j];
      } else {
        if (p[i] != s[j]) {
          if (i != p.length && j != s.length) {
            i--;
            continue;
          }
          match = false;
          break;
        }
      }
      i++;
      j++;
    }
    print(symbolMap);
    print('i: $i ---------- j: $j');
    if (symbolMap.isEmpty && p.length != s.length) return false;
    return match;
  }
}

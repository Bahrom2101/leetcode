import 'dart:collection';
import 'dart:math';

void main(List<String> args) {
  print(lengthOfLongestSubstring(
      'dsjdvbhjvng'));
}

int lengthOfLongestSubstring(String s) {
  HashMap<String, int> map = HashMap<String, int>();
  int res = 0, j = -1;
  for (int i = 0; i < s.length; i++) {
    if (map.containsKey(s[i])) {
      j = max(j, map[s[i]]!);
    }
    map[s[i]] = i;
    res = max(res, i - j);
    print(map);
    print(j);
    print(res);
    print('----------------------');
  }
  return res;
}

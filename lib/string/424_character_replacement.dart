void main() {
  print(characterReplacement('TADSTRATBBFTT', 2));
}

int characterReplacement(String s, int k) {
  if(s.length == k) return k;
  var sFreq = List.filled(26, 0);
  Map<String, List<int>> map = {};
  for (int i = 0; i < s.length; i++) {
    if (map[s[i]] != null) {
      map[s[i]]!.add(i);
    } else {
      map[s[i]] = [i];
    }
  }
  print(map);
  int maxCommon = 0;
  for (var list in map.values) {
    for(int i = 1; i < list.length; i++) {
      var distance = list[i] - list[i - 1] - 1;
      if(distance == k) {
        maxCommon = distance + 2;
      } else if(distance < k) {
        maxCommon = distance + 2;
      }
    }
  }
  return maxCommon;
}

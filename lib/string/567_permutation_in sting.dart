void main() {
  print(checkInclusion1('afn', 'thfafnw'));
}

bool checkInclusion(String s1, String s2) {
  if (s1.length > s2.length) return false;
  for (int i = 0; i < s2.length; i++) {
    if (s2[i] == s1[0]) {
      bool has = true;
      int index = 0;
      if (i - s1.length + 1 > 0) {
        for (int j = i - s1.length + 1; j <= i; j++) {
          if (s2[j] != s1[s1.length - index - 1]) {
            has = false;
            break;
          }
          index++;
        }
        if (has) return has;
      }
      has = true;
      index = 0;
      if (i + s1.length < s2.length) {
        for (int j = i; j < i + s1.length; j++) {
          if (s2[j] != s1[index]) {
            has = false;
            break;
          }
          index++;
        }
        if (has) return has;
      }
    }
  }
  return false;
}

bool checkInclusion1(String s1, String s2) {
  if (s1.length > s2.length) {
    return false;
  }

  List<int> s1map = List<int>.filled(26, 0, growable: false);
  List<int> s2map = List<int>.filled(26, 0, growable: false);

  for (var i = 0; i < s1.length; i++) {
    s1map[s1.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
  }
  for (var i = 0; i < (s2.length - s1.length); i++) {
    if (matches(s1map, s2map)) {
      return true;
    }

    s2map[s2.codeUnitAt(i + s1.length) - 'a'.codeUnitAt(0)]++;
    s2map[s2.codeUnitAt(i) - 'a'.codeUnitAt(0)]--;
  }

  return matches(s1map, s2map);
}

bool matches(List<int> s1map, List<int> s2map) {
  for (int i = 0; i < 26; i++) {
    if (s1map[i] != s2map[i]) {
      return false;
    }
  }
  return true;
}

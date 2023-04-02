void main() {
  // print(isIsomorphic('badc', 'baba'));
  print(isIsomorphic('paper', 'title'));
}

bool isIsomorphic(String s, String t) {
  if (s.length != t.length) return false;
  Map<String, String> map = {};
  Set<String> mappedChars = {};
  for (int i = 0; i < s.length; i++) {
    String charS = s[i];
    String charT = t[i];

    if (map.containsKey(charS)) {
      if (map[charS] != charT) {
        print('1');
        return false;
      }
    } else {
      if (mappedChars.contains(charT)) {
        print('2');
        return false;
      }
      map[charS] = charT;
      mappedChars.add(charT);
    }
    print(map);
    print(mappedChars);
    print('-------------');
  }
  return true;
}

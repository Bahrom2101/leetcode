import 'dart:collection';

void main() {
  print(findAnagrams('cbbaebabacd', 'abbc'));
}

List<int> findAnagrams(String s, String p) {
  if (p.length > s.length) return [];

  List<int> indices = [];
  List<int> pFreq = List.filled(26, 0);
  List<int> sFreq = List.filled(26, 0);

  // compute frequency of characters in p
  for (int i = 0; i < p.length; i++) {
    pFreq[p.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
  }

  // iterate over s and check for anagrams
  for (int i = 0; i < s.length; i++) {
    // add current character to sFreq
    sFreq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;

    // remove first character of previous window from sFreq
    if (i >= p.length) {
      sFreq[s.codeUnitAt(i - p.length) - 'a'.codeUnitAt(0)]--;
    }

    // check if current window is an anagram
    if (i >= p.length - 1 && matches(pFreq, sFreq)) {
      indices.add(i - p.length + 1);
    }
  }

  return indices;
}

bool matches(List<int> s1map, List<int> s2map) {
  for (int i = 0; i < 26; i++) {
    if (s1map[i] != s2map[i]) {
      return false;
    }
  }
  return true;
}

List<int> findAnagrams1(String s, String p) {
  if (p.length > s.length) return [];
  List<int> indices = [];
  Map<String, int> pMap = {};
  for (int i = 0; i < p.length; i++) {
    pMap[p[i]] = (pMap[p[i]] ?? 0) + 1;
  }
  var queue = DoubleLinkedQueue<String>();
  for (int i = 0; i < p.length; i++) {
    queue.addLast(s[i]);
  }
  var map = {...pMap};
  bool anagram = true;
  for (var element in queue) {
    if (map[element] == null) {
      anagram = false;
      break;
    } else if (map[element] == 1) {
      map.remove(element);
    } else {
      map[s[0]] = map[s[0]]! - 1;
    }
  }
  if (anagram) indices.add(0);
  for (int i = p.length; i < s.length; i++) {
    queue.removeFirst();
    queue.addLast(s[i]);
    map = {...pMap};
    bool anagram = true;
    for (var element in queue) {
      if (map[element] == null) {
        anagram = false;
        break;
      } else if (map[element] == 1) {
        map.remove(element);
      } else {
        map[element] = map[element]! - 1;
      }
    }
    if (anagram) indices.add(i - p.length + 1);
  }
  return indices;
}

void main() {
  var s = Solution();
  // print(s.findSubstring('barfoofoobarthefoobarman', ["bar", "foo", "the"]));
  // print(s.findSubstring('barfoothefoobarman', ["bar", "foo"]));
  // print(s.findSubstring('wordgoodgoodgoodbestword', ["word", "good", "best", "word"]));
  print(s.findSubstring('lingmindraboofooowingdingbarrwingmonkeypoundcake',
      ["fooo", "barr", "wing", "ding", "wing"]));
}

class Solution {
  List<int> findSubstring(String s, List<String> words) {
    int wordLength = words.first.length;
    List<int> startsList = [];
    Map<String, int> wordsMap = {};
    for (var w in words) {
      if (!wordsMap.containsKey(w)) {
        wordsMap[w] = 1;
      } else {
        wordsMap[w] = wordsMap[w]! + 1;
      }
    }
    int i = 0;
    int j = words.length * wordLength - 1;
    while (j < s.length) {
      var subs = s.substring(i, j + 1);
      if (doContainAll(subs, {...wordsMap}, wordLength)) {
        startsList.add(i);
      }
      i++;
      j++;
    }
    return startsList;
  }

  bool doContainAll(String subS, Map<String, int> wordsMap, int wordLength) {
    for (int i = 0; i < subS.length; i += wordLength) {
      var subString = subS.substring(i, i + wordLength);
      if (!wordsMap.containsKey(subString)) {
        return false;
      } else if (wordsMap[subString]! > 1) {
        wordsMap[subString] = wordsMap[subString]! - 1;
      } else {
        wordsMap.remove(subString);
      }
    }
    return true;
  }
}

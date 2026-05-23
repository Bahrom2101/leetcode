void main() {
  var s = Solution();
  print(s.findSubstring('barfoofoobarthefoobarman', ["bar", "foo", "the"]));
  print(s.findSubstring('barfoothefoobarman', ["bar", "foo"]));
  print(s.findSubstring(
      'wordgoodgoodgoodbestword', ["word", "good", "best", "word"]));
}

class Solution {
  List<int> findSubstring(String s, List<String> words) {
    List<int> startsList = [];
    var wordsLength = words.join().length;
    int i = 0;
    int j = wordsLength - 1;

    while (j < s.length) {
      var subs = s.substring(i, j + 1);
      bool containAll = doContainAll(subs, words);
      if (containAll) {
        startsList.add(i);
      }
      i++;
      j++;
    }
    return startsList;
  }

  bool doContainAll(String s, List<String> words) {
    List<String> sList = [];
    for (int i = 0; i < s.length; i += words.first.length) {
      sList.add(s.substring(i, i + words.first.length));
    }
    for (var w in words) {
      if (!sList.contains(w)) {
        return false;
      } else {
        for (int i = 0; i < sList.length; i++) {
          if (sList[i] == w) {
            sList.removeAt(i);
            break;
          }
        }
      }
    }
    return true;
  }
}

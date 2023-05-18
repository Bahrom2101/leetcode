void main() {
  // print(longestPalindrome(["lc", "cl", "gg"]));
  print(longestPalindrome(["ab", "ty", "yt", "lc", "cl", "ab"]));
  // print(longestPalindrome(["cc", "ll", "xx"]));
}

int longestPalindrome(List<String> words) {
  Map<String, int> map = {};
  for (int i = 0; i < words.length; i++) {
    if (map[words[i]] == null) {
      map[words[i]] = 1;
    } else {
      map[words[i]] = map[words[i]]! + 1;
    }
  }
  print(map);
  var list = [];
  for (int i = 0; i < words.length; i++) {
    var reversed = reverse(words[i]);
    if (map[words[i]] != null || map[reversed] != null) {
      list.add(words[i]);
    }
  }
  print(list);
  int count = 0;
  return count;
}

String reverse(String word) {
  return '${word[1]}${word[0]}';
}

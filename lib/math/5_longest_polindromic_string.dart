void main(List<String> args) {
  print(longestPalindrome('babad'));
}

String longestPalindrome(String s) {
  if (s.length == 1) {
    return s;
  }
  String longest = '';
  Map<String, List<int>> map = {};
  for (int i = 0; i < s.length; i++) {
    if (map[s[i]] != null) {
      final list = map[s[i]]!;
      list.add(i);
      map[s[i]] = list;
    } else {
      map[s[i]] = [i];
    }
  }
  map.forEach((key, value) {
    print('$key : $value');
    for (int i = 0; i < value.length; i++) {
      for (int j = i; j < value.length; j++) {
        String subs = s.substring(value[i], value[j] + 1);
        if (isPalindrome(subs) && subs.length > longest.length) {
          longest = subs;
        }
      }
    }
  });
  return longest.isEmpty && s.isNotEmpty ? s[0] : longest;
}

bool isPalindrome(String s) {
  bool isPalindrome = true;
  int index = 0;
  while (index < s.length / 2) {
    if (s[index] != s[s.length - index - 1]) {
      isPalindrome = false;
      break;
    }
    index++;
  }
  return isPalindrome;
}

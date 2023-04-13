void main() {
  print(getHint('1123', '0111')); // 1A1B
  print(getHint('238472', '345345')); // 1A1B
}

String getHint(String secret, String guess) {
  List<String> first = secret.split('');
  List<String> second = guess.split('');
  Map<String, int> dict = {};
  int numA = 0;
  int numB = 0;
  for (int i = secret.length - 1; i > -1; i--) {
    if (first[i] == second[i]) {
      numA++;
      first.removeAt(i);
      second.removeAt(i);
    } else {
      if (!dict.containsKey(secret[i])) {
        dict[secret[i]] = 0;
      }
      dict[secret[i]] = (dict[secret[i]] ?? 0) + 1;
    }
  }
  for (int i = 0; i < second.length; i++) {
    if (dict.containsKey(second[i]) && dict[second[i]]! > 0) {
      numB++;
      dict[second[i]] = dict[second[i]]! - 1;
    }
  }
  return "${numA}A${numB}B";
}

String getHint1(String secret, String guess) {
  int bulls = 0;
  int cows = 0;
  Map<String, List<int>> map = {};
  for (int i = 0; i < secret.length; i++) {
    if (map[secret[i]] == null) {
      map[secret[i]] = [i];
    } else {
      map[secret[i]]!.add(i);
    }
    if (secret[i] == guess[i]) {
      bulls++;
    }
  }
  print(map);
  for (int i = 0; i < guess.length; i++) {
    if (map[guess[i]] != null &&
        map[guess[i]]!.isNotEmpty &&
        !map[guess[i]]!.contains(i)) {
      map[guess[i]]!.removeLast();
      cows++;
    }
  }
  return '${bulls}A${cows}B';
}

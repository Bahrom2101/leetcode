void main() {
  print(characterReplacement('BAAAB', 2));
}

//18119565334174252

int characterReplacement(String s, int k) {
  if (s.length == k) return k;
  List<int> commons1 = List.filled(s.length, 1);
  List<int> commons2 = List.filled(s.length, 1);
  int stepped = 0;
  for (int i = 0; i < s.length; i++) {
    String pointer = s[i];
    for (int j = i + 1; j < s.length; j++) {
      if (s[j] == pointer && stepped != k) {
        commons1[i]++;
      } else if (stepped != k) {
        commons1[i]++;
        stepped++;
      } else if (s[j] == pointer) {
        commons1[i]++;
      } else {
        break;
      }
    }
    stepped = 0;
  }
  for (int i = s.length - 1; i >= 0; i--) {
    String pointer = s[i];
    for (int j = i - 1; j >= 0; j--) {
      if (s[j] == pointer && stepped != k) {
        commons2[i]++;
      } else if (stepped != k) {
        commons2[i]++;
        stepped++;
      } else if (s[j] == pointer) {
        commons2[i]++;
      } else {
        break;
      }
    }
    stepped = 0;
  }
  int maxCommon = 0;
  for (int i = 0; i < commons1.length; i++) {
    if (commons1[i] > maxCommon) {
      maxCommon = commons1[i];
    }
    if (commons2[i] > maxCommon) {
      maxCommon = commons2[i];
    }
  }
  return maxCommon;
}

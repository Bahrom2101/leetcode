void main(List<String> args) {
  print(convert('x', 4));
}

String convert(String s, int numRows) {
  // Map<int, String> map = {};
  String newS = '';
  int alfa = s.length ~/ (2 * numRows - 2);
  print(alfa);
  for (int i = 0; i < alfa; i++) {
    for (int j = 0; j < numRows; j++) {
      if (j == 0 || j == numRows - 1) {
        // map[j] = (map[j] ?? '') += '';
      }
    }
  }

  return newS;
}

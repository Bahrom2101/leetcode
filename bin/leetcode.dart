void main(List<String> arguments) {
  String s = 'mississippi';
  String p = '"mis*is*ip*."';
  print(isMatch(s, p));
}

bool isMatch(String s, String p) {
  var pSplitList = p.split('*');

  List<String> couples = [];

  for (int i = 0; i < pSplitList.length - 1; i++) {
    couples.add('${pSplitList[i]}${pSplitList[i + 1]}');
  }

  for (var v in couples) {
    if (s.contains(v) || v == '.') {
      return true;
    }
  }
  return false;
}

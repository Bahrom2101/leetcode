void main() {
  print(backspaceCompare('y#fo##f', 'y#f#o###f'));
}

bool backspaceCompare(String s, String t) {
  List<String> listS = [];
  List<String> listT = [];
  for (int i = s.length - 1; i >= 0; i--) {
    if (s[i] != '#') {
      if (listS.isEmpty) {
        listS.add(s[i]);
      } else if (listS.last == '#') {
        listS.removeLast();
      } else {
        listS.add(s[i]);
      }
    } else {
      listS.add(s[i]);
    }
  }
  for (int i = t.length - 1; i >= 0; i--) {
    if (t[i] != '#') {
      if (listT.isEmpty) {
        listT.add(t[i]);
      } else if (listT.last == '#') {
        listT.removeLast();
      } else {
        listT.add(t[i]);
      }
    } else {
      listT.add(t[i]);
    }
  }
  for (int i = 0; i < listS.length; i++) {
    if (listS[i] == '#') {
      listS[i] = '';
    }
  }
  for (int i = 0; i < listT.length; i++) {
    if (listT[i] == '#') {
      listT[i] = '';
    }
  }
  return listS.join('') == listT.join('');
}

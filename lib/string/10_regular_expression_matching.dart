void main(List<String> arguments) {
  String s = 'mississippi';
  // String p = 'mis*is*ip*.'; // true
  String p = 'mis*is*p*.'; // false
  print(isMatch(s, p));

}

bool isMatch(String s, String p) {
  if(!p.contains('*')) {
    return s == p;
  }

  return false;
}

String removeDuplicateChar(String s) {
  var list = s.split('');
  String ss = '';
  for (int i = 0; i < list.length - 1; i++) {
    if(list[i] != list[i+1]) {
      ss += list[i];
    }
  }
  return ss;
}

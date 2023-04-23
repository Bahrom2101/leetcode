void main() {
  print(longestCommonPrefix(["flower","flow","flight"]));
}

String longestCommonPrefix(List<String> strs) {
  String common = '';
  String minLength = strs[0];
  for (var element in strs) {
    if (element.length < minLength.length) {
      minLength = element;
    }
  }
  for(int i = 0; i < minLength.length; i++) {
    var prefix = minLength.substring(0,i + 1);
    for(int j = 0; j < strs.length; j++) {
      if(strs[j].substring(0, i + 1) != prefix) {
        return common;
      }
    }
    common = prefix;
  }
  return common;
}

void main() {
  print(decodeString('30[a]2[bc]')); // abc abc cd cd cd ef
}

String decodeString(String s) {
  if (s.split(RegExp(r'\d')).length == 1) return s;
  List<String> sList = [];
  for (int i = 0; i < s.length; i++) {
    sList.add(s[i]);
  }
  List<Point> brackets = [];
  for (int i = 0; i < sList.length; i++) {
    if (sList[i] == '[') {
      brackets.add(Point('[', i));
    }
    if (sList[i] == ']') {
      var lastPoint = brackets.removeLast();
      int number = determineNumber(sList, lastPoint.index - 1);
      String cut = '';
      sList[lastPoint.index] = '';
      for(int j = lastPoint.index + 1; j < i; j++) {
        cut = cut + sList[j];
        sList[j] = '';
      }
      String timesCut = cut;
      while(number > 1) {
        timesCut = '$timesCut$cut';
        number--;
      }
      sList[i] = timesCut;
    }
  }
  return sList.join('');
}

int determineNumber(List<String> s, int ending) {
  String number = '';
  for (int i = ending; i >= 0; i--) {
    if (s[i].codeUnitAt(0) >= 48 && s[i].codeUnitAt(0) <= 57) {
      number = s[i] + number;
      s[i] = '';
    } else {
      break;
    }
  }
  return int.parse(number);
}

class Point {
  String value;
  int index;

  Point(this.value, this.index);

  @override
  String toString() {
    return 'Point{value: $value, index: $index}';
  }
}

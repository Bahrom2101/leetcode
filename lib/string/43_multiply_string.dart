void main() {
  print(multiply('0', '0'));
}

/*
*                  1234875
* x                  79352
*            ---------------
*                  2469750
*                 61743750
*                370462500
*              11113875000
*              86441250000
* */

String multiply(String num1, String num2) {
  List<String> list = layers(num1, num2);

  String temp = list[0];
  for (int i = 1; i < list.length; i++) {
    var sNumber = list[i];
    int inMemory = 0;
    String sTemp = '';
    for (int j = sNumber.length - 1; j >= 0; j--) {
      int number1 = int.parse(sNumber[j]);
      int number2 = int.parse(temp[j]);
      sTemp = '${(number1 + number2 + inMemory) % 10}$sTemp';
      inMemory = (number1 + number2 + inMemory) ~/ 10;
    }
    temp = sTemp;
  }
  int leadingIndexNonZero = 0;
  bool allZero = true;
  for (int i = 0; i < temp.length; i++) {
    if (temp[i] != '0') {
      leadingIndexNonZero = i;
      allZero = false;
      break;
    }
  }
  return allZero ? '0' : temp.substring(leadingIndexNonZero, temp.length);
}

List<String> layers(String num1, String num2) {
  String big = '';
  String small = '';
  if (num1.length > num2.length) {
    big = num1;
    small = num2;
  } else {
    big = num2;
    small = num1;
  }

  List<String> list = [];
  int maxLength = 0;

  for (int i = small.length - 1; i >= 0; i--) {
    var number = int.parse(small[i]);
    int inMemory = 0;
    String temp = '';
    for (int j = big.length - 1; j >= 0; j--) {
      var number2 = int.parse(big[j]);
      var times = number * number2;
      temp = '${(times + inMemory) % 10}$temp';
      inMemory = (times + inMemory) ~/ 10;
    }
    if (inMemory >= 1) {
      temp = '$inMemory$temp';
    }
    for (int j = 0; j < list.length; j++) {
      temp = '${temp}0';
    }
    list.add(temp);
    if (temp.length > maxLength) {
      maxLength = temp.length;
    }
  }
  for (int i = 0; i < list.length; i++) {
    String temp = '';
    for (int j = 0; j < maxLength - list[i].length + 1; j++) {
      temp = '${temp}0';
    }
    list[i] = '$temp${list[i]}';
  }

  return list;
}

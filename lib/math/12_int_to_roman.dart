import 'dart:math';

void main(List<String> args) {
  print(intToRoman(58));
}

String intToRoman(int num) {
  String ss = '';
  int degree = 1;
  while (num > 0) {
    String s = '';
    int last = num % pow(10, degree).toInt();
    switch (degree) {
      case 1:
        {
          if (last < 4) {
            for (int i = 0; i < last; i++) {
              s += 'I';
            }
          } else if (last == 4) {
            s += 'IV';
          } else if (last == 5) {
            s += 'V';
          } else if (last < 9) {
            s += 'V';
            for (int i = 0; i < last - 5; i++) {
              s += 'I';
            }
          } else {
            s += 'IX';
          }
          break;
        }
      case 2:
        {
          if (last < 40) {
            for (int i = 0; i < last ~/ 10; i++) {
              s += 'X';
            }
          } else if (last == 40) {
            s += 'XL';
          } else if (last == 50) {
            s += 'L';
          } else if (last < 90) {
            s += 'L';
            for (int i = 0; i < (last - 50) ~/ 10; i++) {
              s += 'X';
            }
          } else {
            s += 'XC';
          }
          break;
        }
      case 3:
        {
          if (last < 400) {
            for (int i = 0; i < last ~/ 100; i++) {
              s += 'C';
            }
          } else if (last == 400) {
            s += 'CD';
          } else if (last == 500) {
            s += 'D';
          } else if (last < 900) {
            s += 'D';
            for (int i = 0; i < (last - 500) ~/ 100; i++) {
              s += 'C';
            }
          } else {
            s += 'CM';
          }
          break;
        }
      case 4:
        {
          if (last < 4000) {
            for (int i = 0; i < last ~/ 1000; i++) {
              s += 'M';
            }
          }
          break;
        }
    }
    num -= last;
    degree++;
    ss = s + ss;
    print(last);
  }
  return ss;
}

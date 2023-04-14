void main() {
  print(addBinary('10', '10')); // 10101
}

String addBinary(String a, String b) {
  String newS = '';
  int inMemory = 0;
  int aIndex = a.length - 1;
  int bIndex = b.length - 1;
  while (aIndex >= 0 && bIndex >= 0) {
    var _a = int.parse(a[aIndex]);
    var _b = int.parse(b[bIndex]);
    switch (_a + _b + inMemory) {
      case 0:
        newS = '0$newS';
        break;
      case 1:
        newS = '1$newS';
        inMemory = 0;
        break;
      case 2:
        newS = '0$newS';
        inMemory = 1;
        break;
      case 3:
        newS = '1$newS';
        inMemory = 1;
        break;
    }
    aIndex--;
    bIndex--;
  }
  while (aIndex >= 0) {
    var aInt = int.parse(a[aIndex]);
    switch (aInt + inMemory) {
      case 0:
        newS = '0$newS';
        break;
      case 1:
        newS = '1$newS';
        inMemory = 0;
        break;
      case 2:
        newS = '0$newS';
        inMemory = 1;
        break;
      case 3:
        newS = '1$newS';
        inMemory = 1;
        break;
    }
    aIndex--;
  }
  while (bIndex >= 0) {
    var bInt = int.parse(b[bIndex]);
    switch (bInt + inMemory) {
      case 0:
        newS = '0$newS';
        break;
      case 1:
        newS = '1$newS';
        inMemory = 0;
        break;
      case 2:
        newS = '0$newS';
        inMemory = 1;
        break;
      case 3:
        newS = '1$newS';
        inMemory = 1;
        break;
    }
    bIndex--;
  }
  if (inMemory == 1) {
    newS = '1$newS';
  }
  return newS;
}

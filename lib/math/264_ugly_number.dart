void main() {
  for(int i = 1; i < 20; i++) {
    print(nthUglyNumber(i));
  }
}

int nthUglyNumber(int n) {
  List<int> uglyNumbers = [1];
  int i2 = 0, i3 = 0, i5 = 0;
  while (uglyNumbers.length < n) {
    int nextUgly = [
      uglyNumbers[i2] * 2,
      uglyNumbers[i3] * 3,
      uglyNumbers[i5] * 5
    ].reduce((a, b) => a < b ? a : b);

    if (nextUgly == uglyNumbers[i2] * 2) i2++;
    if (nextUgly == uglyNumbers[i3] * 3) i3++;
    if (nextUgly == uglyNumbers[i5] * 5) i5++;

    uglyNumbers.add(nextUgly);
  }

  return uglyNumbers[n - 1];
}

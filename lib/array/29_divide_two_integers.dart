void main() {
  // print(pow(2, 31) - 1);
  // print(pow(-2, 31));
  // print(pow(-2, 31)/-1);
  // print('=' * 100);
  // print(divide(10, 3));
  // print(divide(7, -3));
  // print(divide(1, -1));
  // print(divide(-1, 1));
  // print(divide(-1, -1));

  // print(divide(2147483647, -1));
  print(divide(-2147483648, 1));
}

int divide(int dividend, int divisor) {
  if (dividend == -2147483648 && divisor == -1) {
    return 2147483647;
  }
  int quotient = 0;
  bool isMinus = (divisor < 0 && dividend > 0) || (dividend < 0 && divisor > 0);
  dividend = dividend.abs();
  divisor = divisor.abs();

  while (dividend >= divisor) {
    dividend -= divisor;
    switch (isMinus) {
      case true:
        quotient -= 1;
      case false:
        quotient += 1;
    }
  }
  if (quotient > 2147483647) {
    return 2147483647;
  } else if (quotient < -2147483648) {
    return -2147483648;
  }
  return quotient;
}

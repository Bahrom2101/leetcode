import 'dart:math';

void main() {
  print(isHappy(4));
}

bool isHappy(int n) {
  if (n == 1) return true;
  if (n == 4) return false;
  int sum = 0;
  while (n > 0) {
    sum += pow(n % 10, 2).toInt();
    n ~/= 10;
  }
  return isHappy(sum);
}

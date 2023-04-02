import 'dart:math';

void main(List<String> args) {
  print(coloredCells(1));
}

int coloredCells(int n) {
  return pow(n - 1, 2).toInt() + pow(n, 2).toInt();
}

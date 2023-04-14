void main() {
  for(int i = 1; i < 20; i++) {
    print('$i: ${mySqrt(i)}');
  }
}

int mySqrt(int x) {
  if(x == 1) return  1;
  for(int i = 1; i <= x ~/ 2 + 1; i++) {
    if(i * i == x) {
      return i;
    } else if(i * i > x) {
      return i-1;
    }
  }
  return 1;
}
void main() {
  print(plusOne([1,2,2,9,9]));
}

List<int> plusOne(List<int> digits) {
  int inMemory = 1;
  for(int i = digits.length - 1; i >= 0; i--) {
    if(digits[i] + inMemory > 9) {
      digits[i] = 0;
    } else {
      digits[i]++;
      inMemory--;
      break;
    }
  }
  if(inMemory > 0) {
    digits = [1,...digits];
  }

  return digits;
}
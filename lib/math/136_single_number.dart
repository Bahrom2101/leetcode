void main() {
  print(singleNumber([2,3,1,4,3,1,2]));
}

int singleNumber(List<int> nums) {
  int result = 0;
  for (int num in nums) {
    result ^= num;
    print('num: $num');
    print('result: $result');
  }
  return result;
}

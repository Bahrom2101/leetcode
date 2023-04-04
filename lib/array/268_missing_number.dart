void main(List<String> args) {
  print(missingNumber([9, 0, 5, 3, 6, 7, 4, 2, 1]));
}

int missingNumber1(List<int> nums) {
  int sum = 0;
  for (int i = 0; i < nums.length; i++) {
    sum += nums[i];
  }
  return nums.length * (nums.length + 1) ~/ 2 - sum;
}

int missingNumber(List<int> nums) {
  int number = 0;
  Map<int, int> map = {};
  for (int i = 0; i < nums.length; i++) {
    map[nums[i]] = 1;
  }
  for (int i = 0; i < nums.length + 1; i++) {
    if (map[i] == null) {
      number = i;
      break;
    }
  }
  return number;
}

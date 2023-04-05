void main() {
  var list = [135,5,234,];
  list = [1];
  rotate(list, 54944);
  print(list);
}

void rotate(List<int> nums, int k) {
  //209945
  while (k >= nums.length) {
    k -= nums.length;
  }
  var list = [
    ...nums.sublist(nums.length - k, nums.length),
    ...nums.sublist(0, nums.length - k)
  ];
  for (int i = 0; i < nums.length; i++) {
    nums[i] = list[i];
  }
}

void main() {
  print(pivotIndex([1, 7, 3, 6, 5, 6]));
  print(pivotIndex([2, 1, -1]));
}

int pivotIndex(List<int> nums) {
  List<int> sums1 = [];
  List<int> sums2 = [];
  sums1.add(nums.first);
  sums2.add(nums.last);
  for (int i = 1; i < nums.length; i++) {
    sums1.add(sums1.last + nums[i]);
    sums2.add(sums2.last + nums[nums.length - i - 1]);
  }
  for (int i = 0; i < sums1.length; i++) {
    if (sums1[i] == sums2[sums2.length - i - 1]) {
      return i;
    }
  }
  return -1;
}

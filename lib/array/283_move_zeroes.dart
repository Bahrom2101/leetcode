void main() {
  //
  var list = [0, 1, 0, 3, 12, 4, 0, 5, 6];
  moveZeroes(list);
  print(list);
}

void moveZeroes(List<int> nums) {
  var list1 = [];
  var list2 = [];
  for(int i = 0; i < nums.length; i++) {
    if (nums[i] == 0) {
      list1.add(nums[i]);
    } else {
      list2.add(nums[i]);
    }
  }
  list2.addAll(list1);
  for (int i = 0; i < nums.length; i++) {
    nums[i] = list2[i];
  }
}

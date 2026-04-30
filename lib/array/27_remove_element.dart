void main() {
  // var nums = [0, 1, 2, 2, 3, 0, 4, 2]; // [0, 1, 3, 0, 4]
  var nums = [3, 2, 2, 3];
  var element = removeElement(nums, 3);
  print('element: $element');
  print('nums: $nums');
}

int removeElement(List<int> nums, int val) {
  nums.add(1111);
  int i = 0;
  while (nums[i] != 1111) {
    if (nums[i] == val) {
      nums.removeAt(i);
    } else {
      i++;
    }
  }
  nums.removeLast();

  return i;
}

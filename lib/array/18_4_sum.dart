void main() {
  print(fourSum([0,0,0,0], 0));
}

List<List<int>> fourSum(List<int> nums, int target) {
  nums.sort();
  List<List<int>> list = [];
  for (int i = 0; i < nums.length - 1; i++) {
    for (int j = i + 1; j < nums.length - 2; j++) {
      int left = j + 1;
      int right = nums.length - 1;
      while (left < right) {
        int sum = nums[i] + nums[j] + nums[left] + nums[right];
        if (sum == target) {
          bool hasThis = false;
          for (var element in list) {
            if (element[0] == nums[i] &&
                element[1] == nums[j] &&
                element[2] == nums[left] &&
                element[3] == nums[right]) {
              hasThis = true;
              break;
            }
          }
          if(!hasThis) {
            list.add([nums[i], nums[j], nums[left], nums[right]]);
          }
        }
        if (sum < target) {
          left++;
        } else {
          right--;
        }
      }
    }
  }
  return list;
}

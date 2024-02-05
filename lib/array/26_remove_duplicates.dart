void main() {
  print(removeDuplicates([1,1,2,]));
  print(removeDuplicates([0,0,1,1,1,2,2,3,3,4]));
}

int removeDuplicates(List<int> nums) {
  List<int> newList = [];
  for(int i = 0; i < nums.length - 1; i++) {
    if(nums[i] != nums[i + 1]) {
      newList.add(nums[i]);
    }
  }
  if(nums[nums.length - 1] != newList.last) {
    newList.add(nums[nums.length - 1]);
  }
  return newList.length;
}
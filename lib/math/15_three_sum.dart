void main(List<String> args) {
  // print(threeSum([-7, 6, 13, 4, 41, 57, 0, -6, 1, -47]));
  print(threeSum([-1, 0, 1, 2, -1, -4]));
}

List<List<int>> threeSum(List<int> nums) {
  List<List<int>> lists = [];
  for (int i = 0; i < nums.length - 1; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      lists.add([nums[i], nums[j]]);
    }
  }
  print(lists);
  for (int i = 0; i < lists.length; i++) {
    for (int j = 0; j < nums.length - 1; j++) {
      if (lists[i][0] + lists[i][1] + nums[j] == 0) {
        lists[i].add(nums[j]);
      }
    }
  }
  print(lists);
  Map<String, List<int>> map = {};
  for (var element in lists) {
    element.sort((a, b) => a > b
        ? 1
        : a == b
            ? 0
            : -1);
    if (element.length == 3 && map[element.toString()] == null) {
      map[element.toString()] = element;
    }
  }
  return map.values.toList();
}

void main() {
  // print(twoSum([2, 7, 11, 15], 9));
  print(twoSum([4, 6, 7, 11, 17, 45], 17));
}

// while (left < right) {
//   final middle = left + (right - left) ~/ 2;
//   print('middle: $middle');
//   if (numbers[middle] + numbers[left] == target) {
//     return [left + 1, middle + 1];
//   } else if (numbers[middle] + numbers[left] > target) {
//     right = middle;
//   } else {
//     left = middle + 1;
//   }
// }

List<int> twoSum(List<int> numbers, int target) {
  int left = 0;
  int right = numbers.length - 1;
  while (left < right) {
    if (numbers[left] + numbers[right] == target) {
      return [left + 1, right + 1];
    } else if (numbers[left] + numbers[right] > target) {
      right--;
    } else {
      left++;
    }
  }
  return [left + 1, right + 1];
}

void main() {
  print(sortedSquares([-4, -1, 0])); // 0, 1, 9, 16, 100
}

List<int> sortedSquares(List<int> nums) {
  int n = nums.length;
  List<int> result = List.filled(n, 0);
  int left = 0;
  int right = n - 1;
  int i = n - 1;

  while (left <= right) {
    int leftSquare = nums[left] * nums[left];
    int rightSquare = nums[right] * nums[right];
    if (leftSquare > rightSquare) {
      result[i--] = leftSquare;
      left++;
    } else {
      result[i--] = rightSquare;
      right--;
    }
  }

  return result;
}
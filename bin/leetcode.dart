void main(List<String> arguments) {
  print(maxElement([3, 1, 7, 2, 5, 7], 0, 5)); // → 7
}

int maxElement(List<int> arr, int lo, int hi) {
  if (lo == hi) return arr[lo];
  int mid = (lo + hi) ~/ 2;
  int leftMax = maxElement(arr, lo, mid);
  int rightMax = maxElement(arr, mid + 1, hi);
  return leftMax > rightMax ? leftMax : rightMax;
}

void subsets(List<int> nums, int index, List<int> current) {
  if (index == nums.length) {
    print(current);
    return;
  }
  subsets(nums, index + 1, [...current, nums[index]]);
  subsets(nums, index + 1, current);
}

void binaryStrings(String current, int n) {
  if (n == 0) {
    print(current);
    return;
  }
  binaryStrings('${current}0', n - 1);
  binaryStrings('${current}1', n - 1);
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

String reverse(String n) {
  if (n.length == 1) return n[0];
  return n[n.length - 1] + reverse(n.substring(0, n.length - 1));
}

int power(int base, int exp) {
  if (exp == 1) return base;

  return base * power(base, exp - 1);
}

int sum(int n) {
  if (n == 0) return 0;
  return n + sum(n - 1);
}

int factorial(int n) {
  if (n == 0) return 1;
  return n * factorial(n - 1);
}

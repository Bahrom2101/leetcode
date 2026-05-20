void main(List<String> arguments) {
  print(countPaths(3, 3));
}

int countPaths(int m, int n) {
  if (m == 1 || n == 1) return 1;
  return countPaths(m - 1, n) + countPaths(m, n - 1);
}

int climbStairs(int n) {
  if (n <= 1) return 1;
  if (n == 2) return 2;
  return climbStairs(n - 1) + climbStairs(n - 2);
}

List<int> mergeSort(List<int> arr) {
  print(arr);
  if (arr.length <= 1) return arr;
  if (arr.length == 2) {
    return arr[0] > arr[1] ? [arr[1], arr[0]] : [arr[0], arr[1]];
  }

  int mid = arr.length ~/ 2;
  List<int> left = mergeSort(arr.sublist(0, mid));
  List<int> right = mergeSort(arr.sublist(mid, arr.length));
  return mergeHelper(left, right);
}

List<int> mergeHelper(List<int> left, List<int> right) {
  var list = <int>[];
  while (left.isNotEmpty && right.isNotEmpty) {
    if (left.first <= right.first) {
      list.add(left.removeAt(0));
    } else {
      list.add(right.removeAt(0));
    }
  }
  list.addAll(left);
  list.addAll(right);
  return list;
}

int binarySearch(List<int> arr, int target, int lo, int hi) {
  if (lo == hi) return arr[lo] == target ? lo : -1;
  int mid = (lo + hi) ~/ 2;
  return arr[mid] == target
      ? mid
      : arr[mid] > target
          ? binarySearch(arr, target, lo, mid)
          : binarySearch(arr, target, mid + 1, hi);
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

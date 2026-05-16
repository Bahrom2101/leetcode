void main(List<String> arguments) {
  subsets([4, 5, 3, 6], 1, []);
  // [5,3,6] [5,3] [5,6] [5] [3,6] [3] [6] []
}

void subsets(
  List<int> nums,
  int index,
  List<int> current,
) {
  if (nums.isEmpty) {
    print(current);
    return;
  }
  var sublist = nums.sublist(index);
  current.addAll(sublist);
  subsets(sublist, index + 1, current);
}

void binaryStrings(String current, int n) {
  if (n == 0) {
    print(current);
    return;
  }
  binaryStrings('${current}0', n - 1);
  binaryStrings('${current}1', n - 1);
}

int fibonacci(int n, [int start = 0, int end = 1]) {
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

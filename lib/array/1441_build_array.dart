void main(List<String> args) {
  print(buildArray([1, 2], 4));
}

List<String> buildArray(List<int> target, int n) {
  List<String> operations = [];
  int stream = 1;
  int count = 0;
  while (count != target.length) {
    operations.add('Push');
    if (target[count] == stream) {
      stream++;
      count++;
    } else {
      operations.add('Pop');
      stream++;
    }
  }
  return operations;
}

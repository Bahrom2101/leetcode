void main() {
  MedianFinder obj = MedianFinder();
  obj.addNum(6);
  print(obj.findMedian());
  obj.addNum(10);
  print(obj.findMedian());
  obj.addNum(2);
  print(obj.findMedian());
  obj.addNum(6);
  print(obj.findMedian());
  obj.addNum(5);
  print(obj.findMedian());
  obj.addNum(0);
  print(obj.findMedian());
  obj.addNum(6);
  print(obj.findMedian());
  obj.addNum(3);
  print(obj.findMedian());
  obj.addNum(1);
  print(obj.findMedian());
  obj.addNum(0);
  print(obj.findMedian());
  obj.addNum(0);
}

class MedianFinder {
  List<int> nums = [];

  void addNum(int num) {
    if (nums.isEmpty) {
      nums.add(num);
    } else {
      int i = 0;
      while (nums[i] <= num && i < nums.length - 1) {
        i++;
      }
      if (nums[i] <= num) {
        nums.insert(i + 1, num);
      } else {
        nums.insert(i, num);
      }
    }
  }

  double findMedian() {
    int n = nums.length;
    if (n % 2 == 0) {
      // average of two middle numbers
      return (nums[n ~/ 2 - 1] + nums[n ~/ 2]) / 2.0;
    } else {
      // middle number
      return nums[n ~/ 2].toDouble();
    }
  }
}

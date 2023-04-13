import 'dart:math';

void main() {
  print(characterReplacement('TTADSTRATBBFTT', 2));
}

int characterReplacement(String s, int k) {
  int maxLength = 0;
  int maxCount = 0;
  int left = 0;
  int right = 0;
  List<int> freq = List.filled(26, 0, growable: false);

  while (right < s.length) {
    freq[s.codeUnitAt(right) - 'A'.codeUnitAt(0)]++;
    maxCount = freq.reduce(max);
    print('left: $left');
    print('right: $right');
    print('freq: $freq');
    print('maxCount: $maxCount');

    if (right - left + 1 - maxCount > k) {
      print('here');
      freq[s.codeUnitAt(left) - 'A'.codeUnitAt(0)]--;
      left++;
    }

    maxLength = maxLength > right - left + 1 ? maxLength : right - left + 1;
    print('maxLength: $maxLength');
    right++;
    print('---------------------');
  }

  return maxLength;
}

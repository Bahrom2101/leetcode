void main() {
  var sol = Solution();
  print(sol.longestValidParentheses('())()(()))('));
}

class Solution {
  int longestValidParentheses(String s) {
    var stack = <int>[-1];
    int max = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(i);
      } else {
        stack.removeLast();
        if (stack.isEmpty) {
          stack.add(i);
        } else {
          if (max < i - stack.last) {
            max = i - stack.last;
          }
        }
      }
    }
    return max;
  }
}

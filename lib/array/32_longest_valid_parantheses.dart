void main() {
  var sol = Solution();
  print(sol.longestValidParentheses('())()(()))('));
}

class Solution {
  int longestValidParentheses(String s) {
    var list = <int>[-1];
    int max = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        list.add(i);
      } else {
        list.removeLast();
        if (list.isEmpty) {
          list.add(i);
        } else {
          if (max < i - list.last) {
            max = i - list.last;
          }
        }
      }
    }
    return max;
  }
}

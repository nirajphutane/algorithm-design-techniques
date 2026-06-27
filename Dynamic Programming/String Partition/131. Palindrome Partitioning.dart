
void main(final List<String> args) {
  print(Solution().partition('aab'));  // [[a, a, b],[aa, b]]
  print(Solution().partition('a'));  // [[a]]
  print(Solution().partition('ab'));  // [[a, b]]

  print(Solution().partition('aaa')); // [[a, a, a], [a, aa], [aa, a], [aaa]]
  print(Solution().partition('abba')); // [[a, b, b, a], [a, bb, a], [abba]]
  print(Solution().partition('abc')); // [[a, b, c]]
  print(Solution().partition('racecar')); // [[r, a, c, e, c, a, r], [r, a, cec, a, r], [r, aceca, r], [racecar]]
  print(Solution().partition('level')); // [[l, e, v, e, l], [l, eve, l], [level]]
  print(Solution().partition('aabb')); // [[a, a, b, b], [a, a, bb], [aa, b, b], [aa, bb]]
  print(Solution().partition('banana')); // [[b, a, n, a, n, a], [b, a, n, ana], [b, a, nan, a], [b, ana, n, a], [b, anana]]
  print(Solution().partition('civic')); // [[c, i, v, i, c], [c, ivi, c], [civic]]
  print(Solution().partition('abcdedcba')); // [[a, b, c, d, e, d, c, b, a], [a, b, c, ded, c, b, a], [a, b, cdedc, b, a], [a, bcdedcb, a], [abcdedcba]]
}

class Solution {
  List<List<String>> partition(final String s) {
    final List<List<String>> result = [];
    final List<String> powerSet = [];

    void dp(final String s) {

      if (s.isEmpty) {
        result.add(List<String>.from(powerSet));
        return;
      }

      for (int i = 1; i <= s.length; i++) {
        final String prefix = s.substring(0, i);
        final String suffix = s.substring(i);

        if (_isPalindrome(prefix)) {
          powerSet.add(prefix);
          dp(suffix);
          powerSet.removeLast();
        }
      }
    }

    dp(s);

    return result;
  }

  bool _isPalindrome(final String s) {
    int l = 0, r = s.length-1;
    while (l < r) if (s[l++] != s[r--]) return false;
    return true;
  }
}

// class Solution {
//   List<List<String>> partition(final String s) {
//     final List<List<String>> result = [];
//     final List<String> powerSet = [];
//
//     void dp(final int i) {
//      if (i == s.length) {
//        result.add(List.from(powerSet));
//        return;
//      }
//
//      for (int j = i; j < s.length; j++) {
//        final String sub = s.substring(i, j+1);
//        if (_isPalindrome(sub)) {
//          powerSet.add(sub);
//          dp(j+1);
//          powerSet.removeLast();
//        }
//      }
//     }
//
//     dp(0);
//
//     return result;
//   }
//
//   bool _isPalindrome(final String s) {
//     for (int i = 0; i < s.length; i++) {
//       if (s[i] != s[s.length-i-1]) {
//         return false;
//       }
//     }
//     return true;
//   }
// }

void main(final List<String> args) {
  print(Solution().partition('aab'));  // [[a, a, b],[aa, b]]
  print(Solution().partition('a'));  // [[a]]
  print(Solution().partition('ab'));  // [[a, b]]
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

        if (isPalindrome(prefix)) {
          powerSet.add(prefix);
          dp(suffix);
          powerSet.removeLast();
        }
      }
    }

    dp(s);

    return result;
  }

  bool isPalindrome(final String s) {
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
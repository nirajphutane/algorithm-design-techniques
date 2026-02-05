
import 'dart:math';

void main(final List<String> args) {
  print(Solution().longestCommonSubsequence('abcde', 'ace')); // ace
  print(Solution().longestCommonSubsequence('abc', 'abc')); // abc
  print(Solution().longestCommonSubsequence('abc', 'def')); // ''

  print(Solution().longestCommonSubsequence('a', 'a'));        // a
  print(Solution().longestCommonSubsequence('a', 'b'));        // ''
  print(Solution().longestCommonSubsequence('', 'abc'));       // ''
  print(Solution().longestCommonSubsequence('abc', ''));       // ''
  print(Solution().longestCommonSubsequence('abcdef', 'zabcf')); // abcf
  print(Solution().longestCommonSubsequence('axbxcxd', 'abcd')); // abcd
  print(Solution().longestCommonSubsequence('abc', 'cba'));     // a / b / c
  print(Solution().longestCommonSubsequence('aaaa', 'aa'));      // aa
  print(Solution().longestCommonSubsequence('aabaa', 'aba'));   // aba
  print(Solution().longestCommonSubsequence('banana', 'ananas'));// anana
  print(Solution().longestCommonSubsequence('abcbdab', 'bdcaba')); // bdab / bcab
  print(Solution().longestCommonSubsequence('xmjyauz', 'mzjawxu')); // mjau
  print(Solution().longestCommonSubsequence('xyz', 'abc')); // ''
  print(Solution().longestCommonSubsequence('123', 'abc')); // ''
  print(Solution().longestCommonSubsequence('AbC', 'abc')); // b
  print(Solution().longestCommonSubsequence('ABC', 'ABC')); // ABC
  print(Solution().longestCommonSubsequence('abcdefghij', 'acegik')); // acegi
}

class Solution {
  String longestCommonSubsequence(final String string1, final String string2) {
    final List<List<int>> dp = List<List<int>>.generate(string1.length+1, (_) => List<int>.filled(string2.length+1, 0));

    for (int r = 1; r < dp.length; r++) {
      for (int c = 1; c < dp.first.length; c++) {
        dp[r][c] = (string1[r-1] == string2[c-1])? 1 + dp[r-1][c-1]: max(dp[r-1][c], dp[r][c-1]);
      }
    }

    if (dp.last.last == 0) return '';

    final List<String> result = List<String>.filled(dp.last.last, '');
    // int i = result.length, r = string1.length, c = string2.length;
    int i = result.length, r = dp.length-1, c = dp.first.length-1;
    while (r > 0 && c > 0) {
      if (string1[r-1] == string2[c-1]) {
        result[--i] = string1[r-1];
        r--; c--;
      } else if (dp[r][c-1] > dp[r-1][c]) {
        c--;
      } else {
        r--;
      }
    }

    return result.join();
  }
}

// class Solution {
//   String longestCommonSubsequence(final String string1, final String string2) {
//     final List<List<int>> dp = List<List<int>>.generate(string1.length+1, (_) => List<int>.filled(string2.length+1, 0));
//
//     for (int r = 1; r <= string1.length; r++) {
//       for (int c = 1; c <= string2.length; c++) {
//         dp[r][c] = (string1[r-1] == string2[c-1])? 1 + dp[r-1][c-1]: max(dp[r-1][c], dp[r][c-1]);
//       }
//     }
//
//     if (dp.last.last == 0) {
//       return '';
//     }
//
//     final List<String> lcs = List<String>.filled(dp.last.last, '');
//     int i = lcs.length-1, r = string1.length, c = string2.length;
//     while (r > 0 && c > 0) {
//       if (string1[r-1] == string2[c-1]) {
//         lcs[i--] = string1[r-1];
//         r--; c--;
//       } else if (dp[r-1][c] > dp[r][c-1]) {
//         r--;
//       } else {
//         c--;
//       }
//     }
//
//     return lcs.join('');
//   }
// }
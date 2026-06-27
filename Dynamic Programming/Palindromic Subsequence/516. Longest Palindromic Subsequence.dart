
import 'dart:io';
import 'dart:math';

void main(final List<String> args) {
  print(Solution().longestPalindromeSubseq('bbbab')); // 4
  print(Solution().longestPalindromeSubseq('cbbd'));  // 2
}

class Solution {
  int longestPalindromeSubseq(final String s) {
    final StringBuffer buffer = StringBuffer();
    for (int i = s.length-1; i >= 0; i--) {
      buffer.write(s[i]);
    }
    final String r = buffer.toString();

    final List<List<int>> dp = List<List<int>>.generate(s.length+1, (index) => List<int>.filled(r.length+1, 0));
    for (int row = 1; row < dp.length; row++) {
      for (int column = 1; column < dp.length; column++) {
        dp[row][column] = (s[row-1] == r[column-1])? 1 + dp[row-1][column-1]: max(dp[row][column-1], dp[row-1][column]);
      }
    }

    return dp.last.last;
  }
}

// class Solution {
//   int longestPalindromeSubseq(final String s) {
//     final StringBuffer buffer = StringBuffer();
//     for (int i = s.length-1; i >= 0; i--) {
//       buffer.write(s[i]);
//     }
//     final String r = buffer.toString();
//
//     final Map<String, int> memo = {};
//     int dp(final int i, final int j) {
//       final String key = '$i:$j';
//
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (i < 0 || j < 0) {
//         return 0;
//       }
//
//       if (s[i] == r[j]) {
//         memo[key] = 1 + dp(i-1, j-1);
//       } else {
//         memo[key] = max(dp(i-1, j), dp(i, j-1));
//       }
//
//       return memo[key]!;
//     }
//
//     return dp(s.length-1, r.length-1);
//   }
// }
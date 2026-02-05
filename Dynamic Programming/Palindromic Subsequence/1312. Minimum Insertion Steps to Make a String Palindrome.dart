
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minInsertions('zzazz')); // 0
  print(Solution().minInsertions('mbadm'));  // 2
  print(Solution().minInsertions('leetcode'));  // 5
}

class Solution {

  int minInsertions(final String s) {
    final StringBuffer buffer = StringBuffer();
    for (int i = s.length-1; i >= 0; i--) {
      buffer.write(s[i]);
    }
    final String r = buffer.toString();

    final List<List<int>> dp = List<List<int>>.generate(s.length+1, (index) => List<int>.filled(r.length+1, 0));

    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= s.length; j++) {
        if (s[i-1] == r[j-1]) {
          dp[i][j] = 1 + dp[i-1][j-1];
        } else {
          dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
        }
      }
    }

    return s.length - dp.last.last;
  }

  // int minInsertions(final String s) {
  //
  //   final StringBuffer buffer = StringBuffer();
  //   for (int i = s.length-1; i >= 0; i--) {
  //     buffer.write(s[i]);
  //   }
  //   final String r = buffer.toString();
  //
  //   final Map<String, int> memo = {};
  //   int dp(final int i, final int j) {
  //     final String key = '$i:$j';
  //     if (memo.containsKey(key)) {
  //       memo[key]!;
  //     }
  //
  //     if (i < 0 || j < 0) {
  //       return 0;
  //     }
  //
  //     if (s[i] == r[j]) {
  //       memo[key] = 1 + dp(i-1, j-1);
  //     } else {
  //       memo[key] = max(dp(i-1, j), dp(i, j-1));
  //     }
  //
  //     return memo[key]!;
  //   }
  //
  //   return s.length - dp(s.length-1, r.length-1);
  // }
}
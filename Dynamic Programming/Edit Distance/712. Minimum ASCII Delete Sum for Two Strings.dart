
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minimumDeleteSum('sea', 'eat'));  // 231
  print(Solution().minimumDeleteSum('delete', 'leet'));  // 403
}

class Solution {
  int minimumDeleteSum(final String s1, final String s2) {
    final List<List<int>> dp = List.generate(s1.length+1, (_) => List.filled(s2.length+1, 0));

    for (int row = 1; row <= s1.length; row++) {
      for (int column = 1; column <= s2.length; column++) {
        if (s1[row-1] == s2[column-1]) {
          dp[row][column] = s1.codeUnitAt(row-1) + dp[row-1][column-1];
        } else {
          dp[row][column] = max(dp[row-1][column], dp[row][column-1]);
        }
      }
    }

    return (s1.codeUnits.reduce((a, b) => a+b) - dp.last.last) + (s2.codeUnits.reduce((a, b) => a+b) - dp.last.last);
  }
}
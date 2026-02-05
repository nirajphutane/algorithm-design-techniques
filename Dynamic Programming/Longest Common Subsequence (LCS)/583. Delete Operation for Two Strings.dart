
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minDistance('sea', 'eat'));  // 2
  print(Solution().minDistance('leetcode', 'etco'));  // 4

  print(Solution().minDistance('', ''));              // 0
  print(Solution().minDistance('abc', 'abc'));        // 0
  print(Solution().minDistance('a', 'a'));            // 0
  print(Solution().minDistance('abcd', 'acd'));       // 1
  print(Solution().minDistance('a', 'b'));            // 2
  print(Solution().minDistance('', 'abc'));           // 3
  print(Solution().minDistance('abc', ''));           // 3
  print(Solution().minDistance('park', 'spake'));     // 3
  print(Solution().minDistance('longstring', 'lngstr')); // 4
  print(Solution().minDistance('abcdef', 'azced'));   // 5
  print(Solution().minDistance('abc', 'def'));        // 6
}

class Solution {

  int minDistance(final String word1, final String word2) {
    final List<List<int>> dp = List<List<int>>.generate(word1.length+1, (_) => List<int>.filled(word2.length+1, 0));
    for (int r = 1; r < dp.length; r++) {
      for (int c = 1; c < dp.first.length; c++) {
        dp[r][c] = (word1[r-1] == word2[c-1])? 1 + dp[r-1][c-1]: max(dp[r-1][c], dp[r][c-1]);
      }
    }

    return (word1.length-dp.last.last) + (word2.length-dp.last.last);
  }
}

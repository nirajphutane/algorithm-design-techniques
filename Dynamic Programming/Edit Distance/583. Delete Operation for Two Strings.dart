
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minDistance('sea', 'eat'));  // 2
  print(Solution().minDistance('leetcode', 'etco'));  // 4
}

class Solution {
  int minDistance(final String word1, final String word2) {
    final List<List<int>> dp = List.generate(word1.length+1, (_) => List.filled(word2.length+1, 0));

    for (int row = 1; row <= word1.length; row++) {
      for (int column = 1; column <= word2.length; column++) {
        if (word1[row-1] == word2[column-1]) {
          dp[row][column] = 1 + dp[row-1][column-1];
        } else {
          dp[row][column] = max(dp[row-1][column], dp[row][column-1]);
        }
      }
    }

    // for (int i = 0; i < dp.length; i++) {
    //   for (int j = 0; j < dp[0].length; j++) {
    //     stdout.write(' ${dp[i][j]} ');
    //   }
    //   stdout.write('\n');
    // }

    return (word1.length-dp.last.last) + (word2.length-dp.last.last);
  }
}
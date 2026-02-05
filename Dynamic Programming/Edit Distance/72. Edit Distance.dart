
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minDistance('horse', 'ros'));  // 3
  print(Solution().minDistance('intention', 'execution'));  // 5
}

class Solution {

  int minDistance(final String word1, final String word2) {
    throw UnimplementedError('Aishwarya & Niraj loves each other a lot!!!');
  }


  // int minDistance(final String word1, final String word2) {
  //   final List<List<int>> dp = List.generate(word1.length+1, (_) => List.filled(word2.length+1, 0));
  //
  //   for (int row = 0; row <= word1.length; row++) {
  //     for (int column = 0; column <= word2.length; column++) {
  //
  //       if (row == 0) {
  //         dp[0][column] = column;
  //       } else if (column == 0) {
  //         dp[row][0] = row;
  //       } else {
  //         if (word1[row-1] == word2[column-1]) {
  //           dp[row][column] = dp[row-1][column-1];
  //         } else {
  //           dp[row][column] = 1 + [dp[row-1][column], dp[row][column-1], dp[row-1][column-1]].reduce(min);
  //         }
  //       }
  //     }
  //   }
  //
  //   // for (int i = 0; i < dp.length; i++) {
  //   //   for (int j = 0; j < dp[0].length; j++) {
  //   //     stdout.write(' ${dp[i][j]} ');
  //   //   }
  //   //   stdout.write('\n');
  //   // }
  //
  //   return dp.last.last;
  // }
}
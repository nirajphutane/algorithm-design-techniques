
import 'dart:io';
import 'dart:math';

void main(final List<String> args) {
  print(Solution().longestCommonSubsequence('abcde', 'ace')); // 3
  print(Solution().longestCommonSubsequence('abc', 'abc')); // 3
  print(Solution().longestCommonSubsequence('abc', 'def')); // 0

  print(Solution().longestCommonSubsequence('', ''));          // 0
  print(Solution().longestCommonSubsequence('a', ''));         // 0
  print(Solution().longestCommonSubsequence('', 'a'));         // 0
  print(Solution().longestCommonSubsequence('abc', 'def'));    // 0
  print(Solution().longestCommonSubsequence('a', 'b'));        // 0
  print(Solution().longestCommonSubsequence('a', 'a'));        // 1
  print(Solution().longestCommonSubsequence('aaaa', 'aa'));    // 2
  print(Solution().longestCommonSubsequence('abc', 'ac'));     // 2
  print(Solution().longestCommonSubsequence('abc', 'abc'));    // 3
  print(Solution().longestCommonSubsequence('abcdef', 'zabcf'));   // 4
  print(Solution().longestCommonSubsequence('aaaaab', 'baaaa'));    // 4
  print(Solution().longestCommonSubsequence('abcdxyz', 'xyzabcd')); // 4
  print(Solution().longestCommonSubsequence('AGGTAB', 'GXTXAYB')); // 4
  print(Solution().longestCommonSubsequence('XMJYAUZ', 'MZJAWXU')); // 4
  print(Solution().longestCommonSubsequence('abcabcaa', 'acbacba'));// 5
}

class Solution {
  int longestCommonSubsequence(final String text1, final String text2) {
    final List<List<int>> dp = List<List<int>>.generate(text1.length+1, (_) => List<int>.filled(text2.length+1, 0));

    for (int r = 1; r < dp.length; r++) {
      for (int c = 1; c < dp.first.length; c++) {
        dp[r][c] = (text1[r-1] == text2[c-1])? 1 + dp[r-1][c-1]: max(dp[r-1][c], dp[r][c-1]);
      }
    }

    return dp.last.last;
  }
}

// class Solution {
//   int longestCommonSubsequence(final String text1, final String text2) {
//
//     final Map<String, int> memo = {};
//     int dfs(final int i, final int j) {
//       final String key = '$i:$j';
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (i < 0 || j < 0) {
//         return 0;
//       }
//
//       if (text1[i] == text2[j]) {
//         memo[key] = 1 + dfs(i-1, j-1);
//       } else {
//         memo[key] = max(dfs(i-1, j), dfs(i, j-1));
//       }
//
//       return memo[key]!;
//     }
//
//     return dfs(text1.length-1, text2.length-1);
//   }
// }
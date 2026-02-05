
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minCut('aab'));  // 1
  print(Solution().minCut('a'));  // 0
  print(Solution().minCut('ab'));  // 1

  print(Solution().minCut('aba'));      // 0
  print(Solution().minCut('abba'));     // 0
  print(Solution().minCut('aab'));      // 1
  print(Solution().minCut('abb'));      // 1
  print(Solution().minCut('aabb'));     // 1
  print(Solution().minCut('banana'));   // 1
  print(Solution().minCut('cdd'));      // 1
  print(Solution().minCut('aaaab'));    // 1
  print(Solution().minCut('bbbab'));    // 1
  print(Solution().minCut('abc'));      // 2
  print(Solution().minCut('noonabbad'));// 2
  print(Solution().minCut('abccbc'));   // 2
  print(Solution().minCut('abcdef'));   // 5
}

class Solution {
  int minCut(final String s) {

    final List<List<bool>> dp = List<List<bool>>.generate(s.length, (_) => List<bool>.filled(s.length, false));
    for (int h = 0; h < dp.length; h++) {
      for (int r = 0, c = h; c < dp.length; r++, c++) {
        if (h == 0) {
          dp[r][c] = true;
        } else if (h == 1) {
          dp[r][c] = s[r] == s[c];
        } else {
          dp[r][c] = (s[r] == s[c] && dp[r+1][c-1]);
        }
      }
    }

    final List<int> cuts = List<int>.filled(s.length, 0);
    for (int i = 0; i < cuts.length; i++) {
      if (dp[0][i]) {
        cuts[i] = 0;
      } else {
        cuts[i] = i;
        for (int j = 1; j <= i; j++) {
          if (dp[j][i])  cuts[i] = min(cuts[i], cuts[j-1]+1);
        }
      }
    }

    return cuts.last;
  }
}
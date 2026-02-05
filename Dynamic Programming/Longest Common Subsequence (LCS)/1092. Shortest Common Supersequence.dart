
import 'dart:math';

void main(final List<String> args) {
  print(Solution().shortestCommonSupersequence('abac', 'cab')); // cabac
  print(Solution().shortestCommonSupersequence('aaaaaaaa', 'aaaaaaaa')); // aaaaaaaa

  print(Solution().shortestCommonSupersequence('abc', 'def')); // abcdef
  print(Solution().shortestCommonSupersequence('abc', 'abc')); // abc
  print(Solution().shortestCommonSupersequence('geek', 'eke')); // geeke
  print(Solution().shortestCommonSupersequence('aaaa', 'aa')); // aaaa
  print(Solution().shortestCommonSupersequence('ab', 'ba')); // aba
  print(Solution().shortestCommonSupersequence('abcd', 'bc')); // abcd
  print(Solution().shortestCommonSupersequence('ace', 'abcde')); // abcde
  print(Solution().shortestCommonSupersequence('aggtab', 'gxtxayb')); // agxgtxayb
}

class Solution {
  String shortestCommonSupersequence(final String str1, final String str2) {
    final List<List<int>> dp = List<List<int>>.generate(str1.length+1, (index) => List<int>.filled(str2.length+1, 0));

    for (int r = 1; r <= str1.length; r++) {
      for (int c = 1; c <= str2.length; c++) {
        dp[r][c] = (str1[r-1] == str2[c-1])? (1 + dp[r-1][c-1]): max(dp[r-1][c], dp[r][c-1]);
      }
    }

    final List<String> res = List<String>.filled((str1.length+str2.length)-dp.last.last, '+');
    int i = res.length, r = str1.length, c = str2.length;
    while (r > 0 && c > 0) {
      if (str1[r-1] == str2[c-1]) {
        res[--i] = str1[--r];
        c--;
      } else if (dp[r][c-1] > dp[r-1][c]) {
        res[--i] = str2[--c];
      } else {
        res[--i] = str1[--r];
      }
    }

    while (c > 0) res[--i] = str2[--c];

    while (r > 0) res[--i] = str1[--r];

    return res.join();
  }
}
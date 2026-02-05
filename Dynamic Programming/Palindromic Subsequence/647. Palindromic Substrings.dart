
void main(final List<String> args) {
  print(Solution().countSubstrings('abc')); // 3
  print(Solution().countSubstrings('aaa'));  // 6
}

class Solution {
  int countSubstrings(final String s) {
    int count = 0;
    final List<List<bool>> dp = List<List<bool>>.generate(s.length, (_) => List<bool>.filled(s.length, false));

    for (int h = 0; h < dp.length; h++) {
      for (int r = 0, c = h; c < dp.length; r++, c++) {
        if (h == 0) {
          dp[r][c] = true;
        } else if (h == 1) {
          dp[r][c] = s[r] == s[c];
        } else {
          dp[r][c] = (s[r] == s[c]) && dp[r+1][c-1];
        }

        if (dp[r][c]) {
          count++;
        }
      }
    }

    return count;
  }
}
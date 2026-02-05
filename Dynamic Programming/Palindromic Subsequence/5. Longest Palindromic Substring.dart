
void main(final List<String> args){
  print(Solution().longestPalindrome('babad'));  // bab
  print(Solution().longestPalindrome('cbbd'));  // bb

  print(Solution().longestPalindrome('a')); // a
  print(Solution().longestPalindrome('aa'));  // aa
  print(Solution().longestPalindrome('ab'));  // a
  print(Solution().longestPalindrome('racecar')); // racecar
  print(Solution().longestPalindrome('abccba'));  // abccba
  print(Solution().longestPalindrome('banana'));  // anana
  print(Solution().longestPalindrome('forgeeksskeegfor')); // geeksskeeg
}

/*
  b a b a d
b t f t f f
a 0 t f t f
b 0 0 t f f
a 0 0 0 t f
d 0 0 0 0 t
*/

class Solution {

  String longestPalindrome(final String s) {
    String result = '';
    final List<List<bool>> dp = List<List<bool>>.generate(s.length, (index) => List<bool>.filled(s.length, false));

    for (int h = 0; h < dp.length; h++) {
      for (int r = 0, c = h; c < dp.length; r++, c++) {
        if (h == 0) {
          dp[r][c] = true;
        } else if (h == 1) {
          dp[r][c] = s[r] == s[c];
        } else {
          dp[r][c] = (s[r] == s[c]) && dp[r+1][c-1];
        }

        if (dp[r][c] && result.length < (c+1-r)) result = s.substring(r,c+1);
      }
    }

    return result;
  }

  // String longestPalindrome(final String s) {
  //   String result = '';
  //
  //   final List<List<bool>> dp = List<List<bool>>.generate(s.length, (_) => List<bool>.filled(s.length, false));
  //
  //   for (int h = 0; h < s.length; h++) {
  //     for (int r = 0, c = h; c < s.length; r++, c++) {
  //       if (h == 0) {
  //         dp[r][c] = true;
  //       } else if (h == 1) {
  //         dp[r][c] = s[r] == s[c];
  //       } else {
  //         if ((s[r] == s[c]) && dp[r+1][c-1]) {
  //           dp[r][c] = true;
  //         }
  //       }
  //
  //       if (dp[r][c] && (result.length < c-r+1)) {
  //          result = s.substring(r, c+1);
  //       }
  //     }
  //   }
  //
  //   // for (int r = 0; r < s.length; r++) {
  //   //   for (int c = 0; c < s.length; c++) {
  //   //     // stdout.write(' ${dp[r][c]} ');
  //   //     stdout.write(' $r,$c ');
  //   //   }
  //   //   stdout.write('\n');
  //   // }
  //
  //   return result;
  // }
}

import 'dart:math';

void main(final List<String> args) {
  print(Solution().findMaxForm(['10','0001','111001','1','0'], 5, 3)); // 4
  print(Solution().findMaxForm(['10','0','1'], 1, 1)); // 2

  print(Solution().findMaxForm(['0','0','0','1','1'], 3, 2)); // 5
  print(Solution().findMaxForm(['0','0','1','1','1'], 2, 2)); // 4
  print(Solution().findMaxForm(['10','10','10'], 2, 2)); // 2
  print(Solution().findMaxForm(['1','1','1','1'], 0, 3)); // 3
  print(Solution().findMaxForm(['0','0','0','0'], 3, 0)); // 3
  print(Solution().findMaxForm(['01','10','001','110'], 3, 3)); // 2
  print(Solution().findMaxForm(['111','000','01'], 3, 3)); // 2
  print(Solution().findMaxForm(['0','1'], 0, 0)); // 0
  print(Solution().findMaxForm(['0','1'], 1, 1)); // 2
}

class Solution {

  int findMaxForm(final List<String> strs, final int m, final int n) {
    throw UnimplementedError('Aishwarya & Niraj loves each other a lot!!!');
  }

  // int findMaxForm(final List<String> strs, final int m, final int n) {
  //
  //   final Map<String, int> memo = {};
  //   int dfs(final int i, final int zeroLen, final int oneLen) {
  //     final String key = '$i:$zeroLen:$oneLen';
  //
  //     if (memo.containsKey(key)) {
  //       return memo[key]!;
  //     }
  //
  //     if (i == strs.length) {
  //       return 0;
  //     }
  //
  //     final int skip = dfs(i+1, zeroLen, oneLen);
  //
  //     final int zeros = strs[i].split('0').length-1;
  //     final int ones = strs[i].length - zeros;
  //     int take = 0;
  //     if (zeros <= zeroLen && ones <= oneLen) {
  //       take = 1 + dfs(i+1, zeroLen-zeros, oneLen-ones);
  //     }
  //
  //     memo[key] = max(skip, take);
  //     return memo[key]!;
  //   }
  //
  //   return dfs(0, m, n);
  // }
}
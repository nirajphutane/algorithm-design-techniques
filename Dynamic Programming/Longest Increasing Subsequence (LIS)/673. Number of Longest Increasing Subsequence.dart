
import 'dart:math';

void main(final List<String> args) {
  print(Solution().findNumberOfLIS([1,3,5,4,7]));  // 2
  print(Solution().findNumberOfLIS([2,2,2,2,2]));  // 5
  print(Solution().findNumberOfLIS([1,2,4,3,5]));  // 2
  print(Solution().findNumberOfLIS([1,1,1,2,2,2]));// 9
  print(Solution().findNumberOfLIS([3,1,2]));      // 1
  print(Solution().findNumberOfLIS([1,2,3,4]));    // 1
  print(Solution().findNumberOfLIS([4,3,2,1]));    // 4
  print(Solution().findNumberOfLIS([1,5,4,3,2,6]));// 4
  print(Solution().findNumberOfLIS([1]));          // 1
  print(Solution().findNumberOfLIS([1,3,2,4,3,5]));// 3
}

class Solution {

  int findNumberOfLIS(final List<int> nums) {
    final List<int> dp = List<int>.filled(nums.length, 1);
    final List<int> counts = List<int>.filled(nums.length, 1);

    int lisSize = 1;
    for (int current = 1; current < nums.length; current++) {
      for (int previous = 0; previous < current; previous++) {
        if (nums[previous] < nums[current]) {
          final int previousLis = dp[previous]+1;
          if (dp[current] < previousLis) {
            dp[current] = previousLis;
            counts[current] = counts[previous];
            lisSize = max(lisSize, dp[current]);
          } else if (dp[current] == previousLis) {
            counts[current] += counts[previous];
          }
        }
      }
    }

    int count = 0;
    for (int i = 0; i < dp.length; i++) {
      if (dp[i] == lisSize) count += counts[i];
    }
    return count;
  }
}

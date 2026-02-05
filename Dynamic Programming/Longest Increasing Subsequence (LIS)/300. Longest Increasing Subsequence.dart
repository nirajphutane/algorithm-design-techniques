
import 'dart:math';

void main(final List<String> args) {
  print(Solution().lengthOfLIS([10,9,2,5,3,7,101,18])); // 4
  print(Solution().lengthOfLIS([0,1,0,3,2,3])); // 4
  print(Solution().lengthOfLIS([7,7,7,7,7,7,7])); // 1

  print(Solution().lengthOfLIS([1]));                  // 1
  print(Solution().lengthOfLIS([5,4,3,2,1]));           // 1
  print(Solution().lengthOfLIS([2,2,2,2,2]));           // 1
  print(Solution().lengthOfLIS([3,1,2]));               // 2
  print(Solution().lengthOfLIS([4,10,4,3,8,9]));        // 3
  print(Solution().lengthOfLIS([-1,3,4,5,2,2,2,2]));    // 4
  print(Solution().lengthOfLIS([1,2,3,4,5]));           // 5
}

class Solution {

  int lengthOfLIS(final List<int> nums) {
    int lis = 1;

    final List<int> dp = List<int>.filled(nums.length, 1);
    for (int current = 1; current < nums.length; current++) {
      for (int previous = 0; previous < current; previous++) {
        // if (nums[previous] < nums[current] && dp[current] < dp[previous] + 1) {
        //   dp[current] = dp[previous] + 1;
        //   lis = max(lis, dp[current]);
        // }

        if (nums[previous] < nums[current]) {
          dp[current] = max(dp[previous] + 1, dp[current]);
          lis = max(lis, dp[current]);
        }
      }
    }

    return lis;
  }
}

// class Solution {
//
//   int lengthOfLIS(final List<int> nums) {
//
//     final List<List<int>> dp = List<List<int>>.generate(nums.length+1, (_) => List<int>.filled(nums.length+1, 0));
//
//     for (int current = nums.length-1; current >= 0; current--) {
//       for (int previous = current-1; previous >= -1; previous--) {
//         final int skip = dp[current+1][previous+1];
//         int take = 0;
//         if (previous == -1 || nums[current] > nums[previous]) {
//           take = 1 + dp[current+1][current+1];
//         }
//         dp[current][previous+1] = max(skip, take);
//       }
//     }
//
//     return dp.first.first;
//   }
// }

// class Solution {
//
//   int lengthOfLIS(final List<int> nums) {
//
//     final Map<String, int> memo = {};
//     int dp(final int currentIndex, final int previousIndex) {
//       final String key = '$currentIndex:$previousIndex';
//
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (currentIndex == nums.length) {
//         return 0;
//       }
//
//       /*final int skip = dp(currentIndex+1, previousIndex);
//       int take = 0;
//       if ((previousIndex == -1) || (nums[currentIndex] > nums[previousIndex])) {
//         take = 1 + dp(currentIndex+1, currentIndex);
//       }
//       memo[key] = max(skip, take);*/
//
//       int lis = dp(currentIndex+1, previousIndex);
//       if ((previousIndex == -1) || (nums[currentIndex] > nums[previousIndex])) {
//         lis = max(lis, 1 + dp(currentIndex+1, currentIndex));
//       }
//       memo[key] = lis;
//
//       return lis;
//     }
//
//     return dp(0, -1);
//   }
// }

void main(final List<String> args) {
  print(Solution().findTargetSumWays([1,1,1,1,1], 3)); // 5
  print(Solution().findTargetSumWays([1], 1)); // 1

  print(Solution().findTargetSumWays([1,2,3], 7)); // 0
  print(Solution().findTargetSumWays([1,2,5], 10)); // 0
  print(Solution().findTargetSumWays([2], 1)); // 0
  print(Solution().findTargetSumWays([2], 2)); // 1
  print(Solution().findTargetSumWays([2], -2)); // 1
  print(Solution().findTargetSumWays([2,3,5,7], 3)); // 2
  print(Solution().findTargetSumWays([0], 0)); // 2
  print(Solution().findTargetSumWays([0,0], 0)); // 4
  print(Solution().findTargetSumWays([1,1,1,1], 2)); // 4
  print(Solution().findTargetSumWays([1,1,1,1], 0)); // 6
  print(Solution().findTargetSumWays([0,0,0], 0)); // 8
}

class Solution {

  int findTargetSumWays(final List<int> nums, final int target) {

    final Map<String, int> memo = {};

    int dp(final int currentSum, final int i) {
      final String key = '$currentSum:$i';

      if (memo.containsKey(key)) {
        return memo[key]!;
      }

      if (i == nums.length) {
        if (currentSum == target) {
          return 1;
        } else {
          return 0;
        }
      }

      memo[key] = dp(currentSum+nums[i], i+1) + dp(currentSum-nums[i], i+1);

      return memo[key]!;
    }

    return dp(0, 0);
  }
}
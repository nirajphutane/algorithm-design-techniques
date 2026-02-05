
void main(final List<String> args) {
  print(Solution().findTargetSumWays([1,1,1,1,1], 3)); // 5
  print(Solution().findTargetSumWays([1], 1)); // 1

  print(Solution().findTargetSumWays([1], -1)); // 1
  print(Solution().findTargetSumWays([2], 1)); // 0
  print(Solution().findTargetSumWays([0,0,0,0,0], 0)); // 32
  print(Solution().findTargetSumWays([0,0,1], 1)); // 4
  print(Solution().findTargetSumWays([1,2,3], 0)); // 2
  print(Solution().findTargetSumWays([1,2,7,9], 13)); // 1
  print(Solution().findTargetSumWays([1,2,1], 2)); // 2
  print(Solution().findTargetSumWays([1000], 1000)); // 1
  print(Solution().findTargetSumWays([1000], -1000)); // 1
}

class Solution {

  int findTargetSumWays(final List<int> nums, final int target) {

    final Map<String, int> memo = {};

    int dp(final int i, final int sum) {
      final String key = '$i:$sum';
      if (memo.containsKey(key)) {
        return memo[key]!;
      }

      if (i == nums.length) {
        return sum == target ? 1 : 0;
      }

      memo[key] = dp(i+1, sum+nums[i]) + dp(i+1, sum-nums[i]);
      return memo[key]!;
    }

    return dp(0, 0);
  }
}
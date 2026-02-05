
import 'dart:math';

void main(final List<String> args) {
  print(Solution().lastStoneWeightII([2,7,4,1,8,1])); // 1
  print(Solution().lastStoneWeightII([31,26,33,21,40])); // 5

  print(Solution().lastStoneWeightII([1,2,3,4]));      // 0
  print(Solution().lastStoneWeightII([1,1]));          // 0
  print(Solution().lastStoneWeightII([0,0,0]));        // 0
  print(Solution().lastStoneWeightII([2,2,2,2]));      // 0
  print(Solution().lastStoneWeightII([10,20,15,5]));   // 0
  print(Solution().lastStoneWeightII([50,50,40,30,20,10])); // 0
  print(Solution().lastStoneWeightII([100,200,150,50]));    // 0
  print(Solution().lastStoneWeightII([8,6,5,4,2]));    // 1
  print(Solution().lastStoneWeightII([1,2]));          // 1
  print(Solution().lastStoneWeightII([0,0,1]));        // 1
  print(Solution().lastStoneWeightII([1,3,5,9,11]));   // 1
  print(Solution().lastStoneWeightII([100,200,150,51])); // 1
  print(Solution().lastStoneWeightII([2,3]));          // 1
  print(Solution().lastStoneWeightII([1]));            // 1
  print(Solution().lastStoneWeightII([3,3,3,3,3]));    // 3
  print(Solution().lastStoneWeightII([1,2,7]));        // 4
}

class Solution {

  int lastStoneWeightII(final List<int> nums) {

    final int totalSum = nums.reduce((a, b) => a+b);

    final Map<String, int> memo = {};
    int dp(final int currentSum, final int i) {
      final String key = '$currentSum+$i';
      if (memo.containsKey(key)) {
        return memo[key]!;
      }

      if (i == nums.length) {
        return (currentSum - (totalSum-currentSum)).abs();
      }

      memo[key] = min(dp(currentSum, i+1), dp(currentSum+nums[i], i+1));
      return memo[key]!;
    }

    return dp(0, 0);
  }
}

import 'dart:math';

void main() {
  print(Solution().minCostClimbingStairs([10,15,20])); // 15
  print(Solution().minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])); // 6

  print(Solution().minCostClimbingStairs([]));              // 0
  print(Solution().minCostClimbingStairs([5]));             // 0
  print(Solution().minCostClimbingStairs([1, 2, 3]));       // 2
  print(Solution().minCostClimbingStairs([1, 100, 1]));     // 2
  print(Solution().minCostClimbingStairs([1, 100, 1, 1]));  // 2
  print(Solution().minCostClimbingStairs([3, 2, 4, 1]));    // 3
  print(Solution().minCostClimbingStairs([5, 10]));         // 5
  print(Solution().minCostClimbingStairs(List.filled(10, 1))); // 5
  print(Solution().minCostClimbingStairs([5, 5, 5]));       // 5
  print(Solution().minCostClimbingStairs([5, 10, 1, 1, 20])); // 7
  print(Solution().minCostClimbingStairs(List.filled(20, 1))); // 10
}

class Solution {
  int minCostClimbingStairs(final List<int> cost) {

    final Map<int, int> memo = {};
    int dp(final int step) {
      if (memo.containsKey(step)) return memo[step]!;

      if (step >= cost.length) return 0;

      memo[step] = cost[step] + min(dp(step+1), dp(step+2));
      return memo[step]!;
    }

    return min(dp(0), dp(1));
  }
}
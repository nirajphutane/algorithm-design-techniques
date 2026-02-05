
void main() {
  print(Solution().climbStairs(1)); // 1
  print(Solution().climbStairs(2)); // 2
  print(Solution().climbStairs(3)); // 3
  print(Solution().climbStairs(4)); // 5
  print(Solution().climbStairs(5)); // 8
  print(Solution().climbStairs(6));  // 13
  print(Solution().climbStairs(7));  // 21
  print(Solution().climbStairs(8));  // 34
  print(Solution().climbStairs(9));  // 55
  print(Solution().climbStairs(10)); // 89
  print(Solution().climbStairs(15)); // 987
  print(Solution().climbStairs(20)); // 10946
  print(Solution().climbStairs(30)); // 1346269
  print(Solution().climbStairs(45)); // 1836311903
}

class Solution {
  int climbStairs(final int n) {
    final Map<int, int> memo = {};
    int dp(final int step) {
      if (memo.containsKey(step)) return memo[step]!;

      if (step <= 2) return step;

      memo[step] = dp(step-1) + dp(step-2);
      return memo[step]!;
    }
    return dp(n);
  }
}

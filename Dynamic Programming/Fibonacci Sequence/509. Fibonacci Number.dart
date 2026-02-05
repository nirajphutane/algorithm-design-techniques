
void main() {
  print(Solution().fib(2)); // 1
  print(Solution().fib(3)); // 2
  print(Solution().fib(4)); // 3
  print(Solution().fib(5));  // 5
  print(Solution().fib(6));  // 8
  print(Solution().fib(7));  // 13
  print(Solution().fib(8));  // 21
  print(Solution().fib(9));  // 34
  print(Solution().fib(10)); // 55
  print(Solution().fib(15)); // 610
  print(Solution().fib(20)); // 6765
  print(Solution().fib(30)); // 832040
}

class Solution {
  int fib(final int n) {
    final Map<int, int> memo = {};
    int dp(final int i) {
      if (memo.containsKey(i)) return memo[i]!;

      if (i == 0) return 0;

      if (i <= 2) return 1;

      memo[i] = dp(i-1) + dp(i-2);
      return memo[i]!;
    }
    return dp(n);
  }
}
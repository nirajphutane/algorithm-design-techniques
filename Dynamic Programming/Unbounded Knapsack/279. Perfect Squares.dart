
import 'dart:math';

void main(final List<String> args) {
  print(Solution().numSquares(12)); // 3
  print(Solution().numSquares(13)); // 2
}

class Solution {
  final int MAX = 1 << 30;
  int numSquares(final int n) => _numSquares(n, {});

  int _numSquares(final int n, final Map<int, int> memo) {
    if (memo.containsKey(n)) {
      return memo[n]!;
    }

    if (n == 0) {
      return 0;
    }

    if (n < 0) {
      return MAX;
    }

    int result = MAX;
    for (int i = 1; (i*i) <= n; i++) {
      result = min(_numSquares(n-(i*i), memo)+1, result);
    }

    memo[n] = result;
    return result;
  }
}
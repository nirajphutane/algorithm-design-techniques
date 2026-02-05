
import 'dart:math';

void main(final List<String> args) {
  print(Solution().coinChange([1,2,5], 11));  // 3
  print(Solution().coinChange([2], 3));  // -1
  print(Solution().coinChange([1], 0));  // 0
  print(Solution().coinChange([1, 3], 4));  // 2
  print(Solution().coinChange([1, 5], 11));  // 3
  print(Solution().coinChange([2, 5, 7], 27)); // 5
}

class Solution {

  int coinChange(final List<int> coins, final int amount) {
    return -1;
  }
}

// class Solution {
//   final int MaxINF = 1 << 30;
//
//   int coinChange(final List<int> coins, final int amount) {
//     final int result = _coinChange(coins, amount, {});
//     return result == MaxINF? -1 : result;
//   }
//
//   int _coinChange(final List<int> coins, final int amount, final Map<int, int> memo) {
//     if (memo.containsKey(amount)) {
//       return memo[amount]!;
//     }
//
//     if (amount == 0) {
//       return 0;
//     }
//
//     if (amount < 0) {
//       return MaxINF;
//     }
//
//     int result = MaxINF;
//     for (final int coin in coins) {
//       result = min(result, _coinChange(coins, amount-coin, memo)+1);
//     }
//
//     memo[amount] = result;
//     return result;
//   }
//
// /*int _coinChange(final List<int> coins, final int amount, final Map<int, int> memo) {
//     if (memo.containsKey(amount)) {
//       return memo[amount]!;
//     }
//
//     if (amount == 0) {
//       return 0;
//     }
//
//     if (amount < 0) {
//       return -1;
//     }
//
//     int result = -1;
//     for (final int coin in coins) {
//       final int count = _coinChange(coins, amount-coin, memo);
//       if (count >= 0) {
//         result = result == -1? count+1: result < (count+1)? result: count+1;
//       }
//     }
//
//     memo[amount] = result;
//     return result;
//   }*/
// }
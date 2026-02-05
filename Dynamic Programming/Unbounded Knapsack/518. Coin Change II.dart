
void main(final List<String> args) {
  print(Solution().change([1,2,5], 5));  // 4
  print(Solution().change([2], 3));  // 0
  print(Solution().change([10], 10));  // 1
}

class Solution {
  int change(final List<int> coins, final int amount) {
     return -1;
  }
}

// class Solution {
//   int change(final List<int> coins, final int amount) => _change(coins, amount, 0, {});
//
//   int _change(final List<int> coins, final int amount, final int i, final Map<String, int> memo) {
//     final String key = '$amount:$i';
//     if (memo.containsKey(key)) {
//       return memo[key]!;
//     }
//
//     if (amount == 0) {
//       return 1;
//     }
//
//     if (i == coins.length || amount < 0) {
//       return 0;
//     }
//
//     int result = 0;
//     for (int j = i; j < coins.length; j++) {
//       result += _change(coins, amount-coins[j], j, memo);
//     }
//
//     memo[key] = result;
//     return result;
//   }
// }
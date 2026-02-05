
import 'dart:io';
import 'dart:math';


void main() {
  int num = 12;
  final Set<int> set = {};
  while (!set.contains(num)) {
    set.add(num);
    int sum = 0;
    while (num != 0) {
      final int digit = num % 10;
      sum += (digit * digit);
      num ~/= 10;
      print('$sum | $num');
    }
    if (sum == 1) {
      print('True');
      return;
    }
    num = sum;
  }
  print('False');
}



// void main (final List<String> args) {
//   print(Solution().findAllConcatenatedWordsInADict(['cat','cats','catsdogcats','dog','dogcatsdog','hippopotamuses','rat','ratcatdogcat'])); // ['catsdogcats','dogcatsdog','ratcatdogcat']
//   print(Solution().findAllConcatenatedWordsInADict(['cat','dog','catdog'])); // ['catdog']
// }
//
// class Solution {
//   List<String> findAllConcatenatedWordsInADict(final List<String> words) {
//     final Set<String> set = words.toSet();
//
//     bool dp(final String word) {
//       if (word.isEmpty) return true;
//
//       for (int i = 1; i < word.length; i++) {
//         final String prefix = word.substring(0, i);
//         final String suffix = word.substring(i);
//
//         if (set.contains(prefix) && set.contains(suffix)) return true;
//
//         if (!set.contains(suffix) && dp(suffix)) return true;
//       }
//
//       return false;
//     }
//
//     final List<String> result = [];
//     for (final String word in words) {
//       if (dp(word)) result.add(word);
//     }
//
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().wordBreak('leetcode', ['leet','code']));  // true
//   print(Solution().wordBreak('applepenapple', ['apple','pen']));  // true
//   print(Solution().wordBreak('catsandog', ['cats','dog','sand','and','cat']));  // false
//
//   print(Solution().wordBreak('abcd', ['a','abc','b','cd'])); // true
//   print(Solution().wordBreak('catsanddog', ['cats','cat','and','sand','dog'])); // true
//   print(Solution().wordBreak('cars', ['car','ca','r','s'])); // true
//   print(Solution().wordBreak('aaaaaaa', ['aaaa','aaa'])); // true
//   print(Solution().wordBreak('pineapplepenapple', ['apple','pen','applepen','pine','pineapple']));// true
//   print(Solution().wordBreak('abcd', ['a', 'bc', 'cd', 'd'])); // true
// }
//
// class Solution {
//   bool wordBreak(final String s, final List<String> wordDict) {
//     final Set<String> set = wordDict.toSet();
//
//     final int size = s.length+1;
//     final List<bool> dp = List<bool>.filled(s.length+1, false);
//     dp.first = true;
//     for (int i = 1; i < size; i++) {
//       for (int j = 0; j < i; j++) {
//         if (dp[j] && set.contains(s.substring(j, i))) {
//           dp[i] = true;
//           break;
//         }
//       }
//     }
//
//     return dp.last;
//
//     // bool dp(final String word) {
//     //   if (word.isEmpty) {
//     //     return true;
//     //   }
//     //
//     //   for (int endIndex = 1; endIndex < word.length; endIndex++) {
//     //     final String prefix = word.substring(0, endIndex);
//     //     final String suffix = word.substring(endIndex);
//     //
//     //     if (set.contains(prefix) && set.contains(suffix)) {
//     //       return true;
//     //     }
//     //
//     //     if (!set.contains(suffix) && dp(suffix)) {
//     //       return true;
//     //     }
//     //   }
//     //
//     //   return false;
//     // }
//     //
//     // return dp(s);
//
//     // bool dp(final int startIndex) {
//     //   if (startIndex == s.length) {
//     //     return true;
//     //   }
//     //
//     //   for (int endIndex = startIndex+1; endIndex < s.length; endIndex++) {
//     //     final String prefix = s.substring(startIndex, endIndex);
//     //     final String suffix = s.substring(endIndex);
//     //
//     //     if (set.contains(prefix) && set.contains(suffix)) {
//     //       return true;
//     //     }
//     //
//     //     if (!set.contains(suffix) && dp(endIndex)) {
//     //       return true;
//     //     }
//     //   }
//     //
//     //   return false;
//     // }
//     //
//     // return dp(0);
//   }
// }

// void main(final List<String> args) {
//   print(Solution().partitionLabels('ababcbacadefegdehijhklij'));  // [9,7,8]
//   print(Solution().partitionLabels('eccbbbbdec'));  // [10]
// }
//
// class Solution {
//   List<int> partitionLabels(final String s) {
//     final Map<String, int> map = {};
//     for (int i = 0; i < s.length; i++) {
//       map[s[i]] = i;
//     }
//
//     final List<int> result = [];
//     int size = 0, endIndex = 0;
//     for (int startIndex = 0; startIndex < s.length; startIndex++) {
//       endIndex = max(endIndex, map[s[startIndex]]!);
//       size++;
//       if (startIndex == endIndex) {
//         result.add(size);
//         size = 0;
//       }
//     }
//
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().canPartitionKSubsets([4,3,2,3,5,2,1], 4)); // true
//   print(Solution().canPartitionKSubsets([1,2,3,4], 3)); // false
// }
//
// class Solution {
//   bool canPartitionKSubsets(final List<int> nums, final int k) {
//     final int total = nums.reduce((a, b) => a + b);
//     if (total % k != 0) {
//       return false;
//     }
//
//     final int target = total ~/ k;
//     nums.sort((a, b) => b.compareTo(a));
//     if (nums.first > target) return false;
//
//     final Set<int> used = {};
//     bool backtrack(final int buckets, final int currentSum, final int i) {
//
//       if (buckets == 0) {
//         return true;
//       }
//
//       if (currentSum == target) {
//         return backtrack(buckets-1, 0, 0);
//       }
//
//       for (int j = i; j < nums.length; j++) {
//         final int sum = currentSum+nums[j];
//         if (!used.contains(j) && sum <= target) {
//           used.add(j);
//           if (backtrack(buckets, sum, j+1)) {
//             return true;
//           }
//           used.remove(j);
//         }
//       }
//
//       return false;
//     }
//
//     return backtrack(k, 0, 0);
//   }
// }

// void main(final List<String> args){
//   print(Solution().longestPalindrome('babad'));  // bab
//   print(Solution().longestPalindrome('cbbd'));  // bb
// }
//
// class Solution {
//   String longestPalindrome(final String s) {
//     String result = '';
//
//     final List<List<bool>> dp = List<List<bool>>.generate(s.length, (_) => List<bool>.filled(s.length, false));
//     for (int h = 0; h < s.length; h++) {
//       for (int r = 0, c = h; c < s.length; r++, c++) {
//         if (h == 0) {
//           dp[r][c] = true;
//         } else if (h == 1) {
//           dp[r][c] = s[r] == s[c];
//         } else {
//           if ((s[r] == s[c]) && dp[r+1][c-1]) {
//             dp[r][c] = true;
//           }
//         }
//
//         if (dp[r][c] && result.length < (c-r+1)) {
//           result = s.substring(r, c+1);
//         }
//       }
//     }
//
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().findNumberOfLIS([1,3,5,4,7]));  // 2
//   print(Solution().findNumberOfLIS([2,2,2,2,2]));  // 5
// }
//
// class Solution {
//
//   int findNumberOfLIS(final List<int> nums) {
//     final List<int> dp = List<int>.filled(nums.length, 1);
//     final List<int> count = List<int>.filled(nums.length, 1);
//
//     int lis = 0;
//     for (int current = 1; current < dp.length; current++) {
//       for (int previous = 0; previous < current; previous++) {
//         if (nums[previous] < nums[current]) {
//           if (dp[current] < (dp[previous]+1)) {
//             dp[current] = 1 + dp[previous];
//             count[current] = count[previous];
//           } else if (dp[current] == (dp[previous]+1)) {
//             count[current] += count[previous];
//           }
//         }
//       }
//       lis = max(lis, dp[current]);
//     }
//
//     int total = 0;
//     for (int i = 0; i < dp.length; i++) {
//      if (dp[i] == lis) {
//        total += count[i];
//      }
//     }
//     return total;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().lengthOfLIS([10,9,2,5,3,7,101,18])); // 4
//   print(Solution().lengthOfLIS([0,1,0,3,2,3])); // 4
//   print(Solution().lengthOfLIS([7,7,7,7,7,7,7])); // 1
// }
//
// class Solution {
//
//   int lengthOfLIS(final List<int> nums) {
//     final int size = nums.length;
//     final List<List<int>> dp = List<List<int>>.generate(size+1, (_) => List<int>.filled(size+1, 0));
//     for (int current = size-1; current >= 0; current--) {
//       for (int previous = current-1; previous >= -1; previous--) {
//         int lis = dp[current+1][previous+1];
//         if (previous == -1 || nums[previous] < nums[current]) {
//           lis = max(lis, 1 + dp[current+1][current+1]);
//         }
//         dp[current][previous+1] = lis;
//       }
//     }
//
//     // for (int r = 0; r <= size; r++) {
//     //   for (int c = 0; c <= size; c++) {
//     //     stdout.write(' ${dp[r][c]} ');
//     //   }
//     //   stdout.write('\n');
//     // }
//
//     return dp.first.first;
//   }
//
//   // int lengthOfLIS(final List<int> nums) {
//   //
//   //   final Map<String, int> memo = {};
//   //   int dp(final int current, final int previous) {
//   //     final String key = '$current:$previous';
//   //
//   //     if (memo.containsKey(key)) {
//   //       return memo[key]!;
//   //     }
//   //
//   //     if (current == nums.length) {
//   //       return 0;
//   //     }
//   //
//   //     int lis = dp(current+1, previous);
//   //     if (previous == -1 || nums[previous] < nums[current]) {
//   //       lis = max(lis, 1 + dp(current+1, current));
//   //     }
//   //     memo[key] = lis;
//   //
//   //     return lis;
//   //   }
//   //
//   //   return dp(0, -1);
//   // }
// }

// void main(final List<String> args) {
//   print(Solution().lengthOfLIS([10,9,2,5,3,7,101,18])); // [2, 5, 7, 101]
//   print(Solution().lengthOfLIS([0,1,0,3,2,3])); // [0, 1, 2, 3]
//   print(Solution().lengthOfLIS([7,7,7,7,7,7,7])); // [7]
// }
//
// class Solution {
//
//   List<int> lengthOfLIS(final List<int> nums) {
//
//     final List<int> indices = List<int>.generate(nums.length, (index) => index);
//     int lisLength = 0, lastLISIndex = 0;
//
//     final List<int> dp = List<int>.filled(nums.length, 1);
//     for (int current = 1; current < nums.length; current++) {
//       for (int previous = 0; previous < current; previous++) {
//         if ((nums[previous] < nums[current]) && ((dp[previous] + 1) > dp[current])) {
//           dp[current] = 1 + dp[previous];
//           indices[current] = previous;
//         }
//       }
//       if (lisLength < dp[current]) {
//         lisLength = dp[current];
//         lastLISIndex = current;
//       }
//     }
//
//     final List<int> lis = List.filled(lisLength, 0);
//     while (lisLength > 0) {
//       lis[--lisLength] = nums[lastLISIndex];
//       lastLISIndex = indices[lastLISIndex];
//     }
//     return lis;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().change([1,2,5], 5));  // 4
//   print(Solution().change([2], 3));  // 0
//   print(Solution().change([10], 10));  // 1
// }
//
// class Solution {
//   int change(final List<int> coins, final int amount) {
//
//     final Map<String, int> memo = {};
//     int dfs(final int i, final int target) {
//       final String key = '$target:$i';
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (target == 0) {
//         return 1;
//       }
//
//       if (target < 0) {
//         return 0;
//       }
//
//       int result = 0;
//       for (int j = i; j < coins.length; j++) {
//         result += dfs(j, target-coins[j]);
//       }
//
//       memo[key] = result;
//       return result;
//     }
//
//     return dfs(0, amount);
//   }
// }

// void main(final List<String> args) {
//   print(Solution().coinChange([1,2,5], 11));  // 3
//   print(Solution().coinChange([2], 3));  // -1
//   print(Solution().coinChange([1], 0));  // 0
//   print(Solution().coinChange([1, 3], 4));  // 2
//   print(Solution().coinChange([1, 5], 11));  // 3
//   print(Solution().coinChange([2, 5, 7], 27)); // 5
// }
//
// class Solution {
//
//   int coinChange(final List<int> coins, final int amount) {
//
//     final int MAX = 1 << 30;
//     final Map<int, int> memo = {};
//
//     int dfs(final int target) {
//
//       if (memo.containsKey(target)) {
//         return memo[target]!;
//       }
//
//       if (target == 0) {
//         return 0;
//       }
//
//       if (target < 0) {
//         return MAX;
//       }
//
//       int result = MAX;
//       for (final int coin in coins) {
//         result = min(result, dfs(target-coin)+1);
//       }
//
//       memo[target] = result;
//       return result;
//     }
//
//     final int count = dfs(amount);
//     return count == MAX? -1: count;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().numSquares(12)); // 3
//   print(Solution().numSquares(13)); // 2
// }
//
// class Solution {
//   int numSquares(final int n) {
//
//     final int MAX = 1 << 30;
//
//     final Map<int, int> memo = {};
//     int dfs(final int target) {
//       if (memo.containsKey(target)) {
//         return memo[target]!;
//       }
//
//       if (target == 0) {
//         return 0;
//       }
//
//       if (target < 0) {
//         return MAX;
//       }
//
//       int result = MAX;
//       for (int i = 1; (i*i) <= target; i++) {
//         result = min(result, dfs(target-(i*i))+1);
//       }
//
//       memo[target] = result;
//       return result;
//     }
//
//     return dfs(n);
//   }
// }

// void main(final List<String> args) {
//   print(Solution().lastStoneWeightII([2,7,4,1,8,1])); // 1
//   print(Solution().lastStoneWeightII([31,26,33,21,40])); // 5
// }
//
// class Solution {
//   int lastStoneWeightII(final List<int> nums) {
//     final int total = nums.reduce((a, b) => a+b);
//
//     final Map<String, int> memo = {};
//     int dfs(final int currentSum, final int i) {
//       final String key = '$currentSum:$i';
//
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (i == nums.length) {
//         return (currentSum - (total-currentSum)).abs();
//       }
//
//       memo[key] = min(dfs(currentSum, i+1), dfs(currentSum+nums[i], i+1));
//
//       return memo[key]!;
//     }
//
//     return dfs(0, 0);
//   }
// }

// void main(final List<String> args) {
//   print(Solution().findTargetSumWays([1,1,1,1,1], 3)); // 5
//   print(Solution().findTargetSumWays([1], 1)); // 1
//
//   print(Solution().findTargetSumWays([1], 0));            // 0
//   print(Solution().findTargetSumWays([1, 2], 0));         // 0
//   print(Solution().findTargetSumWays([1, 2, 7, 9], 100)); // 0
//   print(Solution().findTargetSumWays([], 1));             // 0
//   print(Solution().findTargetSumWays([1], -1));           // 1
//   print(Solution().findTargetSumWays([1, 2], 3));         // 1
//   print(Solution().findTargetSumWays([1, 2], -1));        // 1
//   print(Solution().findTargetSumWays([1, 2, 7, 9], 5));   // 1
//   print(Solution().findTargetSumWays([0], 0));            // 2
//   print(Solution().findTargetSumWays([1, 1], 0));         // 2
//   print(Solution().findTargetSumWays([1, 2, 3], 0));      // 2
//   print(Solution().findTargetSumWays([2, 2, 2], 2));      // 3
//   print(Solution().findTargetSumWays([0, 0], 0));         // 4
//   print(Solution().findTargetSumWays([0, 0, 1], 1));      // 4
//   print(Solution().findTargetSumWays([2, 2, 2, 2], 0));   // 6
//   print(Solution().findTargetSumWays([0, 0, 0], 0));      // 8
// }
//
// class Solution {
//   int findTargetSumWays(final List<int> nums, final int target) {
//     final Map<String, int> memo = {};
//     int dfs(final int currentSum, final int i) {
//       final String key = '$currentSum:$i';
//
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (i == nums.length) {
//         return currentSum == target? 1: 0;
//       }
//
//       memo[key] = dfs(currentSum+nums[i], i+1) + dfs(currentSum-nums[i], i+1);
//
//       return memo[key]!;
//     }
//
//     return dfs(0, 0);
//   }
// }

// void main(final List<String> args) {
//   print(Solution().canPartition([1,5,11,5])); // true
//   print(Solution().canPartition([1,2,3,5])); // false
//
//   print(Solution().canPartition([1, 1]));              // true
//   print(Solution().canPartition([3, 3, 3, 4, 5]));      // true
//   print(Solution().canPartition([1, 1, 1, 1]));        // true
//   print(Solution().canPartition([1, 2, 3, 4, 5, 6, 7])); // true
//   print(Solution().canPartition([100, 100]));          // true
//   print(Solution().canPartition([100, 99, 1]));        // true
//
//   print(Solution().canPartition([1]));                 // false
//   print(Solution().canPartition([2]));                 // false
//   print(Solution().canPartition([1, 2]));              // false
//   print(Solution().canPartition([2, 2, 3, 5]));        // false
//   print(Solution().canPartition([2, 3, 4, 6]));        // false
// }
//
// class Solution {
//   bool canPartition(final List<int> nums) {
//
//     final int total = nums.reduce((a, b) => a+b);
//
//     if (total.isOdd) {
//       return false;
//     }
//
//     final int mid = (total~/2);
//
//     final Map<String, bool> memo = {};
//     bool dfs(final int currentSum, final int i) {
//       final String key = '$currentSum:$i';
//
//       if (memo.containsKey(key)) {
//         return memo[key]!;
//       }
//
//       if (currentSum == mid) {
//         return true;
//       }
//
//       if (i == nums.length || currentSum > mid) {
//         return false;
//       }
//
//       memo[key] = dfs(currentSum, i+1) || dfs(currentSum+nums[i], i+1);
//       return memo[key]!;
//     }
//
//     return dfs(0, 0);
//   }
// }

// void main() {
//   print(Solution().minCostClimbingStairs([10,15,20])); // 15
//   print(Solution().minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])); // 6
// }
//
// class Solution {
//   int minCostClimbingStairs(final List<int> cost) => min(_minCostClimbingStairs(0, cost, {}), _minCostClimbingStairs(1, cost, {}));
//
//   int _minCostClimbingStairs(final int step, final List<int> cost, final Map<int, int> memo) {
//     if (memo.containsKey(step)) {
//       return memo[step]!;
//     }
//
//     if (step >= cost.length) {
//       return 0;
//     }
//
//     memo[step] = cost[step] + min(_minCostClimbingStairs(step+1, cost, {}), _minCostClimbingStairs(step+2, cost, {}));
//     return memo[step]!;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().canConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'ef', 'c'])); // true
//   print(Problem().canConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd'])); // true
//   print(Problem().canConstruct('enterapotentpot', ['a', 'p', 'ent', 'enter', 'ot', 'o', 't'])); // true
//   print(Problem().canConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl'])); // true
//   print(Problem().canConstruct('aaaaaaaaaaaaaaaaaaaa', ['a', 'aa', 'aaa', 'aaaa', 'aaaaa'])); // true
//   print(Problem().canConstruct('', ['cat', 'dog'])); // true
//   print(Problem().canConstruct('hello', ['he', 'llo'])); // true
//   print(Problem().canConstruct('skateboard', ['ska', 'te', 'board'])); // true
//   print(Problem().canConstruct('abc', ['ab', 'ac'])); // false
//   print(Problem().canConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee', 'eeeeee'],)); // false
//   print(Problem().canConstruct('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // false
//   print(Problem().canConstruct('a', [])); // false
//   print(Problem().canConstruct('hello', ['hell', 'world'])); // false
// }
//
// class Problem {
//   bool canConstruct(final String target, final List<String> wordBank) => _canConstruct(target, wordBank, {});
//
//   bool _canConstruct(final String target, final List<String> wordBank, final Map<String, bool> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target]!;
//     }
//
//     if (target.isEmpty) {
//       return true;
//     }
//
//     for (final String word in wordBank) {
//       if (target.startsWith(word)) {
//         final bool canConstruct = _canConstruct(target.substring(word.length), wordBank, memo);
//         if (canConstruct) {
//           memo[target] = true;
//           return true;
//         }
//       }
//     }
//
//     memo[target] = false;
//     return false;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().countConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'ef', 'c'])); // 4
//   print(Problem().countConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd'])); // 1
//   print(Problem().countConstruct('enterapotentpot', ['a', 'p', 'ent', 'enter', 'ot', 'o', 't'])); // 4
//   print(Problem().countConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl'])); // 2
//   print(Problem().countConstruct('aaaaaaaaaaaaaaaaaaaa', ['a', 'aa', 'aaa', 'aaaa', 'aaaaa'])); // 400096
//   print(Problem().countConstruct('', ['cat', 'dog'])); // 1
//   print(Problem().countConstruct('hello', ['he', 'llo'])); // 1
//   print(Problem().countConstruct('skateboard', ['ska', 'te', 'board'])); // 1
//   print(Problem().countConstruct('abc', ['ab', 'ac'])); // 0
//   print(Problem().countConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee', 'eeeeee'])); // 0
//   print(Problem().countConstruct('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // 0
//   print(Problem().countConstruct('a', [])); // 0
//   print(Problem().countConstruct('hello', ['hell', 'world'])); // 0
// }
//
// class Problem {
//   int countConstruct(final String target, final List<String> wordBank) => _countConstruct(target, wordBank, {});
//
//   int _countConstruct(final String target, final List<String> wordBank, final Map<String, int> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target]!;
//     }
//
//     if (target.isEmpty) {
//       return 1;
//     }
//
//     int totalCount = 0;
//     for (final String word in wordBank) {
//       if (target.startsWith(word)) {
//         totalCount += _countConstruct(target.substring(word.length), wordBank, memo);
//       }
//     }
//
//     memo[target] = totalCount;
//     return totalCount;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().allConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'ef', 'c'])); // [[ab, cd, ef], [ab, c, def], [abc, def], [abcd, ef]]
//   print(Problem().allConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd'])); // [[abc, def]]
//   print(Problem().allConstruct('enterapotentpot', ['a', 'p', 'ent', 'enter', 'ot', 'o', 't'])); // [[enter, a, p, ot, ent, p, ot], [enter, a, p, o, t, ent, p, ot], [enter, a, p, ot, ent, p, o, t], [enter, a, p, o, t, ent, p, o, t]]
//   print(Problem().allConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl'])); // [[purp, le], [p, ur, p, le]]
//   print(Problem().allConstruct('', ['cat', 'dog'])); // [[]]
//   print(Problem().allConstruct('hello', ['he', 'llo'])); // [[he, llo]]
//   print(Problem().allConstruct('skateboard', ['ska', 'te', 'board'])); // [[ska, te, board]]
//   print(Problem().allConstruct('abc', ['ab', 'ac'])); // []
//   print(Problem().allConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee', 'eeeeee'])); // []
//   print(Problem().allConstruct('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // []
//   print(Problem().allConstruct('a', [])); // []
//   print(Problem().allConstruct('hello', ['hell', 'world'])); // []
// }
//
// class Problem {
//   List<List<String>> allConstruct(final String target, final List<String> wordBank) => _allConstruct(target, wordBank, {});
//
//   List<List<String>> _allConstruct(final String target, final List<String> wordBank, final Map<String, List<List<String>>> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target]!;
//     }
//
//     if (target.isEmpty) {
//       return [[]];
//     }
//
//     final List<List<String>> result = [];
//     for (final String word in wordBank) {
//       if (target.startsWith(word)) {
//         for (final List<String> list in _allConstruct(target.substring(word.length), wordBank, memo)) {
//           result.add([word, ...list]);
//         }
//       }
//     }
//
//     memo[target] = result;
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().canPartition([1,5,11,5])); // true
//   print(Solution().canPartition([1,2,3,5])); // false
// }
//
// class Solution {
//   bool canPartition(final List<int> nums) {
//     final int totalSum = nums.reduce((a, b) => a+b);
//
//     if (totalSum.isOdd) return false;
//
//     final int target = totalSum ~/ 2;
//     final Set<int> sums = {0};
//     for (final int num in nums) {
//       final Set<int> nextSum = Set.of(sums);
//       for (final int sum in sums) {
//         final int addition = num + sum;
//         if (addition == target) return true;
//         if (addition < target) nextSum.add(addition);
//       }
//       sums.clear();
//       sums.addAll(nextSum);
//     }
//
//     return false;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().canSum(7, [2, 3])); // true
//   print(Problem().canSum(7, [5, 3, 4, 7])); // true
//   print(Problem().canSum(8, [2, 3, 5])); // true
//   print(Problem().canSum(999, [2, 3, 7])); // true
//   print(Problem().canSum(500, [7, 13, 29])); // true
//   print(Problem().canSum(1023, [3, 9, 27])); // true
//   print(Problem().canSum(10000, [7, 14, 28, 1])); // true
//   print(Problem().canSum(123456, [37, 41, 73])); // true
//   print(Problem().canSum(1001, [13, 17])); // true
//   print(Problem().canSum(997, [6, 10, 15])); // true
//
//   print(Problem().canSum(99999, [111, 222, 333])); // false
//   print(Problem().canSum(7, [2, 4])); // false
//   print(Problem().canSum(300, [7, 14])); // false
//   print(Problem().canSum(10000, [7, 14, 28])); // false
//
// }
//
// class Problem {
//   bool canSum(final int target, final List<int> numbers) =>
//       _canSum(target, numbers, {});
//
//   bool _canSum(final int target, final List<int> numbers, final Map<int, bool> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target]!;
//     }
//
//     if (target == 0) {
//       return true;
//     }
//
//     if (target < 0) {
//       return false;
//     }
//
//     for (final int number in numbers) {
//       if (_canSum(target - number, numbers, memo)) {
//         memo[target] = true;
//         return true;
//       }
//     }
//
//     memo[target] = false;
//     return false;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().bestSum(7, [5, 3, 4, 7])); // [7]
//   print(Problem().bestSum(8, [2, 3, 5])); // [3, 5]
//   print(Problem().bestSum(8, [1, 4, 5])); // [4, 4]
//   print(Problem().bestSum(100, [1, 2, 5, 25])); // [25, 25, 25, 25]
// }
//
// class Problem {
//
//   List<int>? bestSum(final int target, final List<int> numbers) => _bestSum(target, numbers, {});
//
//   List<int>? _bestSum(final int target, final List<int> numbers, final Map<int, List<int>?> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target];
//     }
//
//     if (target == 0) {
//       return [];
//     }
//
//     if (target < 0) {
//       return null;
//     }
//
//     List<int>? result = null;
//     for (final int number in numbers) {
//       final List<int>? combination = _bestSum(target-number, numbers, memo);
//       if (combination != null) {
//         if (result == null || result.length > combination.length) {
//           result = [...combination, number];
//         }
//       }
//     }
//
//     memo[target] = result;
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().howSum(7, [2, 3])); // [[2, 2, 3], [2, 3, 2], [3, 2, 2]]
//   print(Problem().howSum(7, [5, 3, 4, 7])); // [[3, 4], [4, 3], [7]]
//   print(Problem().howSum(8, [2, 3, 5])); // [[2, 2, 2, 2], [2, 3, 3], [3, 2, 3], [3, 3, 2], [3, 5], [5, 3]]
//   print(Problem().howSum(7, [2, 4])); // []
//   print(Problem().howSum(300, [7, 14])); // []
// }
//
// class Problem {
//
//   List<List<int>> howSum(final int target, final List<int> numbers) => _howSum(target, numbers, {});
//
//   List<List<int>> _howSum(final int target, final List<int> numbers, final Map<int, List<List<int>>> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target]!;
//     }
//
//     if (target == 0) {
//       return [[]];
//     }
//
//     if (target < 0) {
//       return [];
//     }
//
//     final List<List<int>> result = [];
//     for (final int number in numbers) {
//       for (final List<int> list in _howSum(target-number, numbers, memo)) {
//         result.add([number, ...list]);
//       }
//     }
//
//     memo[target] = result;
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Problem().howSum(7, [2, 3])); // [3, 2, 2]
//   print(Problem().howSum(7, [5, 3, 4, 7])); // [7]
//   print(Problem().howSum(8, [2, 3, 5])); // [2, 2, 2, 2]
//   print(Problem().howSum(7, [2, 4])); // null
//   print(Problem().howSum(300, [7, 14])); // null
// }
//
// class Problem {
//
//   List<int>? howSum(final int target, final List<int> numbers) => _howSum(target, numbers, {});
//
//   List<int>? _howSum(final int target, final List<int> numbers, final Map<int, List<int>?> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target];
//     }
//
//     if (target == 0) {
//       return [];
//     }
//
//     if (target < 0) {
//       return null;
//     }
//
//     for (final int number in numbers) {
//       final List<int>? combination = _howSum(target-number, numbers, memo);
//       if (combination != null) {
//         memo[target] = [...combination, number];
//         return memo[target];
//       }
//     }
//
//     memo[target] = null;
//     return null;
//   }
// }

// --------
// void main(final List<String> args) {
//   print(Solution().productExceptSelf([1,2,3,4]));  // [24,12,8,6]
//   print(Solution().productExceptSelf([-1,1,0,-3,3]));  // [0,0,9,0,0]
// }
//
// class Solution {
//
//   List<int> productExceptSelf(final List<int> nums) {
//     final List<int> result = List.filled(nums.length, 1);
//
//     for (int i = 1; i < nums.length; i++) {
//       result[i] = result[i-1] * nums[i-1];
//     }
//
//     int suffix = 1;
//     for (int i = nums.length-2; i >= 0; i--) {
//       suffix *= nums[i+1];
//       result[i] *= suffix;
//     }
//
//     return result;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().subarraySum([1, 1, 1], 2));  // 2
//   print(Solution().subarraySum([1, 2, 3], 3));  // 2
//   print(Solution().subarraySum([], 0)); // 0
//   print(Solution().subarraySum([0, 0, 0], 0));  // 6
//   print(Solution().subarraySum([3, 4, 7, 2, -3, 1, 4, 2], 7)); // 4
//   print(Solution().subarraySum([1], 1));  // 1
//   print(Solution().subarraySum([1], 2));  // 0
//   print(Solution().subarraySum([1, -1, 1, -1, 1], 1));  // 6
// }
//
// class Solution {
//   int subarraySum(final List<int> nums, final int k) {
//     final Map<int, int> map = {0: 1};
//     int count = 0, prefixSum = 0;
//
//     for (final int num in nums) {
//       prefixSum += num;
//       final int sub = prefixSum - k;
//       if (map.containsKey(sub)) {
//         count += map[sub]!;
//       }
//
//       map[prefixSum] = (map[prefixSum]?? 0) + 1;
//     }
//
//     return count;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().subarraysDivByK([4,5,0,-2,-3,1], 5));  // 7
//   print(Solution().subarraysDivByK([5], 9));  // 0
//   print(Solution().subarraysDivByK([2,3,6,1,4], 3));  // 4
//   print(Solution().subarraysDivByK([-1,2,9], 2)); // 2
//   print(Solution().subarraysDivByK([7,7,7,7], 7));  // 10
//   print(Solution().subarraysDivByK([1,-1,1,-1,1], 2));  // 6
//   print(Solution().subarraysDivByK([10,-3,-7,20,-10], 10)); // 10
//   print(Solution().subarraysDivByK([0,0,0], 3));  // 6
//   print(Solution().subarraysDivByK([8,1,2,9], 5));  // 1
//   print(Solution().subarraysDivByK([100,-50,-25,-25,1], 25)); //10
//   print(Solution().subarraysDivByK([5,5,5,5,5], 5));  // 15
//   print(Solution().subarraysDivByK([-5,-10,15], 5));  // 6
//   print(Solution().subarraysDivByK([1,2,3,4,5,6], 7));  // 3
//   print(Solution().subarraysDivByK([-2,-2,-2,-2], 4));  // 4
// }
//
//
// class Solution {
//   int subarraysDivByK(final List<int> nums, final int k) {
//     int count = 0, prefixSum = 0;
//     final Map<int, int> frequency = {prefixSum: 1};
//     for (final int num in nums) {
//       prefixSum += num;
//       int reminder = prefixSum % k;
//       if (reminder.isNegative) {
//         reminder += k;
//       }
//       if (frequency.containsKey(reminder)) {
//         count += frequency[reminder]!;
//       }
//       frequency[reminder] = (frequency[reminder]?? 0) + 1;
//     }
//     return count;
//   }
// }

// void main(final List<String> args) {
//   print(Solution().checkSubarraySum([23,2,4,6,7], 6));  // true
//   print(Solution().checkSubarraySum([23,2,6,4,7], 6));  // true
//   print(Solution().checkSubarraySum([23,2,6,4,7], 13)); // false
//   print(Solution().checkSubarraySum([5,0], 5));               // true
//   print(Solution().checkSubarraySum([0,0], 7));               // true
//   print(Solution().checkSubarraySum([0,0,0], 3));             // true
//   print(Solution().checkSubarraySum([-1,2,9], 2));            // true
//   print(Solution().checkSubarraySum([5,-5], 5));              // true
//   print(Solution().checkSubarraySum([-2,-2], 4));             // true
//   print(Solution().checkSubarraySum([-1,-1,-1], 3));          // true
//   print(Solution().checkSubarraySum([-1,1], 1));              // true
//   print(Solution().checkSubarraySum([1,-1,5], 3));            // true
//   print(Solution().checkSubarraySum([2,-2,2,-2], 2));         // true
//   print(Solution().checkSubarraySum([4,-1,-3,7], 3));         // true
//   print(Solution().checkSubarraySum([10,-3,-7,20,-10], 10));  // true
//   print(Solution().checkSubarraySum([1,2,3], 6));             // true
//   print(Solution().checkSubarraySum([1,2,3], 3));             // true
//   print(Solution().checkSubarraySum([2,4,3], 6));             // true
//   print(Solution().checkSubarraySum([6,3,1,2], 3));           // true
//   print(Solution().checkSubarraySum([1000000000,1000000000], 1000000000)); // true
//   print(Solution().checkSubarraySum([5], 5));                 // false
//   print(Solution().checkSubarraySum([0,1,0], 2));             // false
//   print(Solution().checkSubarraySum([0], 3));                 // false
//   print(Solution().checkSubarraySum([1000000000], 100));      // false
// }
//
// class Solution {
//   bool checkSubarraySum(final List<int> nums, final int k) {
//     final Map<int, int> map = {0: -1};
//
//     int prefixSum = 0;
//     for (int i = 0; i < nums.length; i++) {
//       prefixSum += nums[i];
//       int reminder = prefixSum % k;
//       if (reminder.isNegative) {
//         reminder += k;
//       }
//
//       if (map.containsKey(reminder)) {
//         if (i - map[reminder]! > 1) {
//           return true;
//         }
//       } else {
//         map[reminder] = i;
//       }
//     }
//     return false;
//   }
// }

// void main(final List<String> args) {
//   NumArray array = NumArray([-2, 0, 3, -5, 2, -1]);
//   print(array.sumRange(0, 2));  // 1
//   print(array.sumRange(2, 5));  // -1
//   print(array.sumRange(0, 5));  // -3
//
//   array = NumArray([4, -1, 2, 7, -3, 5, -2]);
//   print(array.sumRange(0, 3));  // 12
//   print(array.sumRange(2, 6));  // 9
//   print(array.sumRange(4, 4));  // -3
//
//   array = NumArray([1, 2, 3, 4, 5]);
//   print(array.sumRange(0, 1));  // 3
//   print(array.sumRange(1, 3));  // 9
//   print(array.sumRange(0, 4));  // 15
//
//   array = NumArray([-1, -2, -3, -4]);
//   print(array.sumRange(1, 2));  // -5
//   print(array.sumRange(0, 3));  // -10
//   print(array.sumRange(2, 3));  // -7
//
//   array = NumArray([1000, -1000, 500, -500, 0]);
//   print(array.sumRange(0, 1));  // 0
//   print(array.sumRange(1, 3));  // -1000
//   print(array.sumRange(0, 4));  // 0
//
//   array = NumArray([9, -4, 2]);
//   print(array.sumRange(0, 0));  // 9
//   print(array.sumRange(1, 1));  // -4
//   print(array.sumRange(0, 2));  // 7
// }
//
// class NumArray {
//
//   final List<int> nums;
//   late final List<int> prefixSum;
//   NumArray(this.nums) {
//     prefixSum = List.filled(nums.length, 0);
//     prefixSum.first = nums.first;
//     for (int i = 1; i < prefixSum.length; i++) {
//       prefixSum[i] = prefixSum[i-1] + nums[i];
//     }
//   }
//
//   int sumRange(final int left, final int right) {
//     if (left == 0) {
//       return prefixSum[right];
//     }
//     return prefixSum[right] - prefixSum[left-1];
//   }
// }

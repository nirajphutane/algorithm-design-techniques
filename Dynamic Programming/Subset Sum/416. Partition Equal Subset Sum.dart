
void main(final List<String> args) {
  print(Solution().canPartition([1,5,11,5])); // true
  print(Solution().canPartition([1,2,3,5])); // false

  print(Solution().canPartition([1, 1]));              // true
  print(Solution().canPartition([3, 3, 3, 4, 5]));      // true
  print(Solution().canPartition([1, 1, 1, 1]));        // true
  print(Solution().canPartition([1, 2, 3, 4, 5, 6, 7])); // true
  print(Solution().canPartition([100, 100]));          // true
  print(Solution().canPartition([100, 99, 1]));        // true

  print(Solution().canPartition([1]));                 // false
  print(Solution().canPartition([2]));                 // false
  print(Solution().canPartition([1, 2]));              // false
  print(Solution().canPartition([2, 2, 3, 5]));        // false
  print(Solution().canPartition([2, 3, 4, 6]));        // false
}

class Solution {

  bool canPartition(final List<int> nums) {
    final int total = nums.reduce((a, b) => a+b);
    if (total.isOdd) {
      return false;
    }

    final int target = total ~/ 2;
    final Map<String, bool> memo = {};
    bool dp(final int currentSum, final int i) {
      final String key = '$currentSum:$i';
      if (memo.containsKey(key)) {
        return memo[key]!;
      }

      if (currentSum == target) {
        return true;
      }

      if (i == nums.length || currentSum > target) {
        return false;
      }

      memo[key] = dp(currentSum, i+1) || dp(currentSum+nums[i], i+1);
      return memo[key]!;
    }

    return dp(0, 0);
  }
}
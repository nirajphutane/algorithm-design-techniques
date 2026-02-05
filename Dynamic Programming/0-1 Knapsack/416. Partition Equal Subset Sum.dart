
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
    final int total = nums.reduce((a, b) => a+ b);
    if (total.isOdd) {
      return false;
    }

    final int target = total ~/ 2;

    final Map<String, bool> memo = {};
    bool _canPartition(final int currentSum, final int i) {
      final String key = '$currentSum:$i';

      if (memo.containsKey(key)) {
        return memo[key]!;
      }

      if (currentSum == target) {
        return true;
      }

      if (i >= nums.length || currentSum > target) {
        return false;
      }

      memo[key] = _canPartition(currentSum, i+1) || _canPartition(currentSum+nums[i], i+1);
      return memo[key]!;
    }


    return _canPartition(0, 0);
  }

  // bool canPartition(final List<int> nums) {
  //   final int totalSum = nums.reduce((a, b) => a+b);
  //
  //   if (totalSum.isOdd) return false;
  //
  //   final int target = totalSum ~/ 2;
  //
  //   final Set<int> sums = {0};
  //   for (final int num in nums) {
  //     final Set<int> nextSums = Set.of(sums);
  //     for (final int sum in sums) {
  //       final int addition = sum + num;
  //       if (addition == target) return true;
  //       if (addition < target) nextSums.add(addition);
  //     }
  //     sums.clear();
  //     sums.addAll(nextSums);
  //   }
  //
  //   return false;
  // }
}
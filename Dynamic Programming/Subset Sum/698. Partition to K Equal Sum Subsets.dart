
void main(final List<String> args) {
  print(Solution().canPartitionKSubsets([4,3,2,3,5,2,1], 4)); // true
  print(Solution().canPartitionKSubsets([1,2,3,4], 3)); // false

  print(Solution().canPartitionKSubsets([2,2,2,2], 2)); // true
  print(Solution().canPartitionKSubsets([3,3,3,3], 4)); // true
  print(Solution().canPartitionKSubsets([1,2,3,4], 1)); // true
  print(Solution().canPartitionKSubsets([1,1,1,1], 4)); // true
  print(Solution().canPartitionKSubsets([10], 1));  // true
  print(Solution().canPartitionKSubsets([0,0,0,0], 2)); // true
  print(Solution().canPartitionKSubsets([0,0,0], 3)); // true
  print(Solution().canPartitionKSubsets([1,1,1,1,2,2,2,2], 4)); // true
  print(Solution().canPartitionKSubsets([2,2,2,2,2,2], 3)); // true
  print(Solution().canPartitionKSubsets([1,1,1,1,1,1,1,1], 4)); // true

  print(Solution().canPartitionKSubsets([1,2,3,4], 3)); // false
  print(Solution().canPartitionKSubsets([5,5,5,5], 3)); // false
  print(Solution().canPartitionKSubsets([1,2,3,4], 4)); // false
  print(Solution().canPartitionKSubsets([10], 2));  // false
  print(Solution().canPartitionKSubsets([2,2,2,2,3,4,5], 4)); // false
}

class Solution {
  bool canPartitionKSubsets(final List<int> nums, final int k) {
    final int total = nums.reduce((a, b) => a+b);
    if (total % k != 0) return false;
    final int target = total ~/ k;

    nums.sort((a, b) => b.compareTo(a));
    if (nums.first > target) return false;

    final Set<int> used = {};
    bool backtrack(final int buckets, final int currentSum, final int i) {
      if (buckets == 0) return true;

      if (currentSum == target) return backtrack(buckets-1, 0, 0);

      for (int j = i; j < nums.length; j++) {
        if (!used.contains(j)) {
          final int sum = currentSum + nums[j];
          if (sum <= target) {
            used.add(j);
            if (backtrack(buckets, sum, j+1)) return true;
            used.remove(j);
          }
        }
      }

      return false;
    }

    return backtrack(k, 0, 0);
  }
}
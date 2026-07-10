
void main(final List<String> args) {
  print(Solution().numSubarraysWithSum([1, 0, 1, 0, 1], 2)); // 4
  print(Solution().numSubarraysWithSum([0, 0, 0, 0, 0], 0)); // 15

  print(Solution().numSubarraysWithSum([], 0)); // 0
  print(Solution().numSubarraysWithSum([1], 0)); // 0
  print(Solution().numSubarraysWithSum([0], 1)); // 0
  print(Solution().numSubarraysWithSum([1, 1, 1], 0)); // 0
  print(Solution().numSubarraysWithSum([0], 0)); // 1
  print(Solution().numSubarraysWithSum([1], 1)); // 1
  print(Solution().numSubarraysWithSum([1, 1], 2)); // 1
  print(Solution().numSubarraysWithSum([1, 0], 1)); // 2
  print(Solution().numSubarraysWithSum([0, 1], 1)); // 2
  print(Solution().numSubarraysWithSum([1, 1, 1], 2)); // 2
  print(Solution().numSubarraysWithSum([0, 0], 0)); // 3
  print(Solution().numSubarraysWithSum([1, 0, 0], 1)); // 3
  print(Solution().numSubarraysWithSum([0, 1, 0], 1)); // 4
  print(Solution().numSubarraysWithSum([1, 0, 1], 1)); // 4
  print(Solution().numSubarraysWithSum([1, 0, 1, 0], 1)); // 6
  print(Solution().numSubarraysWithSum([0, 0, 1, 0, 0], 1)); // 9
}

class Solution {
  int numSubarraysWithSum(final List<int> nums, final int goal) {

    int prefixSum = 0, count = 0;
    final Map<int, int> frequency = {prefixSum: 1};

    for (final int num in nums) {
      prefixSum += num;

      final int sub = prefixSum - goal;
      if (frequency.containsKey(sub)) {
        count += frequency[sub]!;
      }

      frequency[prefixSum] = (frequency[prefixSum]?? 0) +1;
    }

    return count;
  }
}
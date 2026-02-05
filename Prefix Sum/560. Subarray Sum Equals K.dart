
void main(final List<String> args) {
  print(Solution().subarraySum([1, 1, 1], 2));  // 2
  print(Solution().subarraySum([1, 2, 3], 3));  // 2
  print(Solution().subarraySum([], 0)); // 0
  print(Solution().subarraySum([0, 0, 0], 0));  // 6
  print(Solution().subarraySum([3, 4, 7, 2, -3, 1, 4, 2], 7)); // 4
  print(Solution().subarraySum([1], 1));  // 1
  print(Solution().subarraySum([1], 2));  // 0
  print(Solution().subarraySum([1, -1, 1, -1, 1], 1));  // 6
}

class Solution {

  int subarraySum(final List<int> nums, final int k) {
    int count = 0, prefixSum = 0;
    final Map<int, int> frequency = {prefixSum: 1};
    for (final int num in nums) {
      prefixSum += num;
      final int sub = prefixSum - k;
      if (frequency.containsKey(sub)) {
        count += frequency[sub]!;
      }
      frequency[prefixSum] = (frequency[prefixSum]?? 0) + 1;
    }
    return count;
  }
}
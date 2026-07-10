
void main(final List<String> args) {
  print(Solution().numberOfSubarrays([1, 1, 2, 1, 1], 3)); // 2
  print(Solution().numberOfSubarrays([2, 4, 6], 1)); // 0
  print(Solution().numberOfSubarrays([2, 2, 2, 1, 2, 2, 1, 2, 2, 2], 2)); // 16

  print(Solution().numberOfSubarrays([], 1)); // 0
  print(Solution().numberOfSubarrays([2], 1)); // 0
  print(Solution().numberOfSubarrays([1], 2)); // 0
  print(Solution().numberOfSubarrays([2, 4, 6, 8], 2)); // 0
  print(Solution().numberOfSubarrays([1], 1)); // 1
  print(Solution().numberOfSubarrays([1, 1], 2)); // 1
  print(Solution().numberOfSubarrays([1, 2, 1], 2)); // 1
  print(Solution().numberOfSubarrays([1, 2, 1, 2, 1], 3)); // 1
  print(Solution().numberOfSubarrays([1, 2, 2, 1], 2)); // 1
  print(Solution().numberOfSubarrays([2, 1], 1)); // 2
  print(Solution().numberOfSubarrays([1, 2], 1)); // 2
  print(Solution().numberOfSubarrays([1, 2, 1, 2], 2)); // 2
  print(Solution().numberOfSubarrays([1, 3, 5], 2)); // 2
  print(Solution().numberOfSubarrays([2, 1, 2, 1, 2, 1, 2], 2)); // 8
  print(Solution().numberOfSubarrays([2, 2, 1, 2, 2], 1)); // 9
}

class Solution {
  int numberOfSubarrays(final List<int> nums, final int k) {

    int prefixSum = 0, count = 0;
    final Map<int, int> frequency = {prefixSum: 1};

    for (final int num in nums) {
      prefixSum += num.isOdd? 1: 0;

      final int sub = prefixSum - k;
      if (frequency.containsKey(sub)) {
        count += frequency[sub]!;
      }

      frequency[prefixSum] = (frequency[prefixSum]?? 0) +1;
    }

    return count;
  }
}
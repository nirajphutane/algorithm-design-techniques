
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxSubArrayLen([1, -1, 5, -2, 3], 3)); // 4
  print(Solution().maxSubArrayLen([-2, -1, 2, 1], 1));  // 2

  print(Solution().maxSubArrayLen([], 0)); // 0
  print(Solution().maxSubArrayLen([], 5)); // 0
  print(Solution().maxSubArrayLen([1], 0)); // 0
  print(Solution().maxSubArrayLen([1], 2)); // 0
  print(Solution().maxSubArrayLen([1, 2, 3], 7)); // 0
  print(Solution().maxSubArrayLen([-1, -2, -3], 1)); // 0
  print(Solution().maxSubArrayLen([0], 0)); // 1
  print(Solution().maxSubArrayLen([5], 5)); // 1
  print(Solution().maxSubArrayLen([-5], -5)); // 1
  print(Solution().maxSubArrayLen([0, 0], 0)); // 2
  print(Solution().maxSubArrayLen([2, -2], 0)); // 2
  print(Solution().maxSubArrayLen([1, -1], 0)); // 2
  print(Solution().maxSubArrayLen([3, 1, -1], 3)); // 3
  print(Solution().maxSubArrayLen([1, 2, -3, 3], 3)); // 4
  print(Solution().maxSubArrayLen([1, -1, 1, -1], 0)); // 4
  print(Solution().maxSubArrayLen([0, 0, 0, 0], 0)); // 4
  print(Solution().maxSubArrayLen([-1, 1, -1, 1, -1, 1], 0)); // 6
}

class Solution {

  int maxSubArrayLen(final List<int> nums, final int k) {
    int maxLength = 0, prefixSum = 0;
    final Map<int, int> positions = {prefixSum: -1};

    for (int i = 0; i < nums.length; i++) {
      prefixSum += nums[i];

      final int sum = prefixSum - k;
      if (positions.containsKey(sum)) {
        maxLength = max(maxLength, i - positions[sum]!);
      }

      if (!positions.containsKey(prefixSum)) {
        positions[prefixSum] = i;
      }
    }

    return maxLength;
  }
}
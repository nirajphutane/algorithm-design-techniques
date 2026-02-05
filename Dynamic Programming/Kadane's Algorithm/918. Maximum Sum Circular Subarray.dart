
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxSubarraySumCircular([1,-2,3,-2])); // 3
  print(Solution().maxSubarraySumCircular([5,-3,5])); // 10
  print(Solution().maxSubarraySumCircular([-3,-2,-3])); // -2
}

class Solution {
  int maxSubarraySumCircular(final List<int> nums) {
    int total = nums.first, currentMax = nums.first, currentMin = nums.first, maxSum = nums.first, minSum = nums.first;

    for (int i = 1; i < nums.length; i++) {
      total += nums[i];

      currentMax = max(nums[i], currentMax+nums[i]);
      maxSum = max(maxSum, currentMax);

      currentMin = min(nums[i], currentMin+nums[i]);
      minSum = min(minSum, currentMin);
    }

    return maxSum.isNegative? maxSum: max(maxSum, total-minSum);
  }
}
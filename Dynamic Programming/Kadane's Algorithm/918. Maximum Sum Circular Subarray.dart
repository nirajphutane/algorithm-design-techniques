
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxSubarraySumCircular([1,-2,3,-2])); // 3
  print(Solution().maxSubarraySumCircular([5,-3,5])); // 10
  print(Solution().maxSubarraySumCircular([-3,-2,-3])); // -2

  print(Solution().maxSubarraySumCircular([-1, -2, -3]));  // -1
  print(Solution().maxSubarraySumCircular([-5, -2, -8]));  // -2
  print(Solution().maxSubarraySumCircular([-5]));          // -5
  print(Solution().maxSubarraySumCircular([0, 0, 0]));     // 0
  print(Solution().maxSubarraySumCircular([0, -1, 0]));    // 0
  print(Solution().maxSubarraySumCircular([2, -2, 2, -2, 2])); // 4
  print(Solution().maxSubarraySumCircular([3, -1, 2, -1])); // 4
  print(Solution().maxSubarraySumCircular([5]));           // 5
  print(Solution().maxSubarraySumCircular([1, 2, 3, 4]));  // 10
  print(Solution().maxSubarraySumCircular([8, -1, -3, 8])); // 16
  print(Solution().maxSubarraySumCircular([9, -4, -7, 9]));    // 18
  print(Solution().maxSubarraySumCircular([4, -4, 6, -6, 10, -11, 12])); // 22
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

import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])); // 6
  print(Solution().maxSubArray([1])); // 1
  print(Solution().maxSubArray([5,4,-1,7,8])); // 23
}

class Solution {
  int maxSubArray(final List<int> nums) {
    int maxSum = nums.first, sum = 0;

    for (final int num in nums) {
      sum += num;

      maxSum = max(maxSum, sum);

      if (sum.isNegative) sum = 0;
    }

    return maxSum;
  }
}

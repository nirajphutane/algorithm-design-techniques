
import 'dart:math';

void main(final List<String> args) {
  print(Solution().findMaxAverage([1,12,-5,-6,50,3], 4)); // 12.75000
  print(Solution().findMaxAverage([5], 1)); // 5.00000

  print(Solution().findMaxAverage([-3, -1, -2], 2));  // -1.5
  print(Solution().findMaxAverage([-5, -6, -1, -4], 2));  // -2.5
  print(Solution().findMaxAverage([-10, 1, 2, 3, 4], 2));  // 3.5
  print(Solution().findMaxAverage([100, -50, -50, -50], 3));  // 0.0
  print(Solution().findMaxAverage([-8, -7, -6, -5], 3));  // -6.0
  print(Solution().findMaxAverage([-1, -2, -3, -4, -5], 5));  // -3.0
  print(Solution().findMaxAverage([-1, -2, 10], 3));  // 7/3 = 2.3333333
  print(Solution().findMaxAverage([0, -1, -2, -3], 2));  // -0.5
  print(Solution().findMaxAverage([-100, 50], 2));  // -25.0
  print(Solution().findMaxAverage([50, -100], 2));  // -25.0
  print(Solution().findMaxAverage([-4, -4, -4, -4], 4));  // -4.0
  print(Solution().findMaxAverage([-2, 100], 1));  // 100.0
  print(Solution().findMaxAverage([-2, -1, 100], 2));  // 49.5
}

class Solution {

  double findMaxAverage(final List<int> nums, final int k) {
    int result = 0;

    int sum = 0;
    for (int i = 0; i < k; i++) {
      sum += nums[i];
    }
    result = sum;
    for (int i = k; i < nums.length; i++) {
      sum -= nums[i-k];
      sum += nums[i];
      result = max(result, sum);
    }

    return result / k;
  }
}
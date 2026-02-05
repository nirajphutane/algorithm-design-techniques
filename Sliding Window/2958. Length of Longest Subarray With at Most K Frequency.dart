
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxSubarrayLength([1,2,3,1,2,3,1,2], 2)); // 6
  print(Solution().maxSubarrayLength([1,2,1,2,1,2,1,2], 1)); // 2
  print(Solution().maxSubarrayLength([5,5,5,5,5,5,5], 4));   // 4
  print(Solution().maxSubarrayLength([1,2,3,1,2,3,1], 1));   // 3
  print(Solution().maxSubarrayLength([1], 1));               // 1
  print(Solution().maxSubarrayLength([1,1,1,1], 2));         // 2
  print(Solution().maxSubarrayLength([1,2,3,4,5], 1));       // 5
  print(Solution().maxSubarrayLength([1,2,2,3,3,3,2,2,1], 2)); // 5
  print(Solution().maxSubarrayLength([1,2,1,2,1,2,1], 1));   // 2
  print(Solution().maxSubarrayLength([7,7,8,8,7,8,8,7], 2)); // 4
  print(Solution().maxSubarrayLength([5,1,3,5,2,3,4,1], 2)); // 8
  print(Solution().maxSubarrayLength([1,2,3,2,2,3,3,3,2], 2)); // 4
  print(Solution().maxSubarrayLength([1,2,3], 0));           // 0
  print(Solution().maxSubarrayLength([], 1));                // 0
  print(Solution().maxSubarrayLength([1,3,1,3,1,3,1,3,1], 4)); // 8
}

class Solution {

  int maxSubarrayLength(final List<int> nums, final int k) {
    int size = 0;
    final Map<int, int> frequency = {};

    for (int l = 0, r = 0; r < nums.length; r++) {
      frequency[nums[r]] = (frequency[nums[r]]?? 0) + 1;

      while (frequency[nums[r]]! > k) {
        frequency[nums[l]] = frequency[nums[l++]]! - 1;
      }

      size = max(size, r-l+1);
    }

    return size;
  }
}
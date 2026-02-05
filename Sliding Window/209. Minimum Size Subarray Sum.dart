
import 'dart:math';

void main(final List<String> args) {
  print(Solution().minSubArrayLen(7, [2,3,1,2,4,3])); // 2
  print(Solution().minSubArrayLen(4, [1,4,4])); // 1
  print(Solution().minSubArrayLen(11, [1,1,1,1,1,1,1,1])); // 0

  print(Solution().minSubArrayLen(7, [8])); // 1
  print(Solution().minSubArrayLen(7, [5, 3]));  // 2
  print(Solution().minSubArrayLen(10, [2, 8, 1, 1, 1])); // 2
  print(Solution().minSubArrayLen(7, [9, 1, 1, 1]));  // 1
  print(Solution().minSubArrayLen(15, [1, 4, 6, 9])); // 2
  print(Solution().minSubArrayLen(5, [6])); // 1
  print(Solution().minSubArrayLen(6, [5])); // 0
  print(Solution().minSubArrayLen(7, [1,2,3,1])); // 4
  print(Solution().minSubArrayLen(7, [5, 3])); // 2
  print(Solution().minSubArrayLen(7, [2, 3, 1])); // 0
  print(Solution().minSubArrayLen(10, [1, 2, 3, 4])); // 4
}

class Solution {
  int minSubArrayLen(final int target, final List<int> nums) {
    int size = nums.length+1, sum = 0;

    for (int l = 0, r = 0; r < nums.length; r++) {
      sum += nums[r];
      while (sum >= target) {
        size = min(size, r-l+1);
        sum -= nums[l++];
      }
    }

    return size > nums.length? 0: size;
  }

  /*int minSubArrayLen(final int target, final List<int> nums) {
    int minSize = nums.length, l = 0, sum = 0;
    for (int r = 0; r < nums.length; r++) {
      sum += nums[r];

      while (sum >= target && r >= l) {
        minSize = min(minSize, r-l+1);
        sum -= nums[l++];
      }
    }

    return l == 0? 0: minSize;
  }*/

}
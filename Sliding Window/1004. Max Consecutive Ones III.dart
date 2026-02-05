
import 'dart:math';

void main(final List<String> args) {
  print(Solution().longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2));  // 6
  print(Solution().longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3));  // 10

  print(Solution().longestOnes([0,1,0,0,1,1,1], 2)); // 6
  print(Solution().longestOnes([1,0,1,1,0,0,1,1,1,0], 2)); // 7
  print(Solution().longestOnes([0,0,1,1,0,1,1,1,1], 2));  // 8
}

class Solution {

  int longestOnes(final List<int> nums, final int k) {
    int size = 0, zeroFrequency = 0;

    for (int l = 0, r = 0; r < nums.length; r++) {
      if (nums[r] == 0) {
        zeroFrequency++;
      }

      while (zeroFrequency > k) {
        if (nums[l++] == 0) {
          zeroFrequency--;
        }
      }

      size = max(size, r-l+1);
    }
    return size;
  }
}
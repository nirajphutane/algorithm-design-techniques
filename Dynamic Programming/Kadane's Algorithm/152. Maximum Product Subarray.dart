
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxProduct([2,3,-2,4])); // 6
  print(Solution().maxProduct([-2,0,-1])); // 0
}

class Solution {
  int maxProduct(final List<int> nums) {
    int maxProduct = nums.first, currentMax = nums.first, currentMin = nums.first;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i].isNegative) {
        final int tmp = currentMin;
        currentMin = currentMax;
        currentMax = tmp;
      }

      currentMax = max(nums[i], currentMax * nums[i]);
      currentMin = min(nums[i], currentMin * nums[i]);

      maxProduct = max(maxProduct, currentMax);
    }

    return maxProduct;
  }
}

// class Solution {
//   int maxProduct(final List<int> nums) {
//     int maxProduct = nums.first, leftProduct = 1, rightProduct = 1;
//     for (int i = 0; i < nums.length; i++) {
//       leftProduct = leftProduct == 0? 1: leftProduct;
//       rightProduct = rightProduct == 0? 1: rightProduct;
//
//       leftProduct *= nums[i];
//       rightProduct *= nums[nums.length-1-i];
//       maxProduct = max(maxProduct, max(leftProduct, rightProduct));
//     }
//
//     return maxProduct;
//   }
// }
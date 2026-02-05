
import 'dart:math';

void main(final List<String> args) {
  print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]));  // 6
  print(Solution().trap([4,2,0,3,2,5]));  // 9
}

class Solution {
  int trap(final List<int> height) {
    int waterTrapped = 0, l = 0, r = height.length-1, leftMax = 0, rightMax = 0;

    while (l < r) {
      leftMax = max(leftMax, height[l]);
      rightMax = max(rightMax, height[r]);

      if (leftMax < rightMax) {
        waterTrapped += leftMax-height[l++];
      } else {
        waterTrapped += rightMax-height[r--];
      }
    }

    return waterTrapped;
  }
}

// class Solution {
//   int trap(final List<int> height) {
//     int waterTrapped = 0;
//
//     final List<int> leftMax = List.filled(height.length, 0);
//     final List<int> rightMax = List.filled(height.length, 0);
//
//     final int len = height.length-1;
//     for (int i = 0; i <= len; i++) {
//       leftMax[i] = i == 0? height[i]: max(leftMax[i-1], height[i]);
//       rightMax[len-i] = len-i == len? height[len]: max(rightMax[len-i+1], height[len-i]);
//     }
//
//     for (int i = 0; i < height.length; i++) {
//       waterTrapped += min(leftMax[i], rightMax[i]) - height[i];
//     }
//     return waterTrapped;
//   }
// }
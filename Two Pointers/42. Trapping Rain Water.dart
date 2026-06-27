
import 'dart:math';

void main(final List<String> args) {
  print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]));  // 6
  print(Solution().trap([4,2,0,3,2,5]));  // 9

  print(Solution().trap([0,0,0,0]));                   // 0
  print(Solution().trap([1,2,3,4,5]));                 // 0
  print(Solution().trap([5,4,3,2,1]));                 // 0
  print(Solution().trap([0,2,0]));                     // 0
  print(Solution().trap([0]));                         // 0
  print(Solution().trap([2,1,2]));                     // 1
  print(Solution().trap([4,2,3]));                     // 1
  print(Solution().trap([2,0,2]));                     // 2
  print(Solution().trap([0,1,0,1,0,1,0,1]));           // 3
  print(Solution().trap([1,0,2,1,0,1,3]));             // 5
  print(Solution().trap([0,1,2,1,0,1,3,2,1,2,1]));     // 5
  print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1,0])); // 6
  print(Solution().trap([3,0,1,3,0,5]));               // 8
  print(Solution().trap([5,2,1,2,1,5]));               // 14
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
//     int trapped = 0, l = 0, r = height.length-1, leftMax = 0, rightMax = 0;
//
//     while (l < r) {
//       leftMax = max(leftMax, height[l]);
//       rightMax = max(rightMax, height[r]);
//
//       final int minHeight = min(leftMax, rightMax);
//       if (height[l] < height[r]) {
//         trapped += (minHeight - height[l++]);
//       } else {
//         trapped += (minHeight - height[r--]);
//       }
//     }
//
//     return trapped;
//   }
// }
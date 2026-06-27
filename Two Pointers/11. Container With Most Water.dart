
import 'dart:math';

void main() {
  print(Solution().maxArea([1,8,6,2,5,4,8,3,7])); // 49
  print(Solution().maxArea([1,1])); // 1

  print(Solution().maxArea([0,0,0,0]));           // 0
  print(Solution().maxArea([1]));                 // 0
  print(Solution().maxArea([1,2]));               // 1
  print(Solution().maxArea([1,2,1]));             // 2
  print(Solution().maxArea([1,2,4,3]));           // 4
  print(Solution().maxArea([1,1,1,1,1]));         // 4
  print(Solution().maxArea([1,2,1,2,1]));         // 4
  print(Solution().maxArea([1,2,3,4,5]));         // 6
  print(Solution().maxArea([5,4,3,2,1]));         // 6
  print(Solution().maxArea([2,3,4,5,18,17,6]));   // 17
  print(Solution().maxArea([1,2,1,3,1,4,1,5,1,6])); // 18
  print(Solution().maxArea([1,3,2,5,25,24,5]));   // 24
  print(Solution().maxArea([1,2,3,4,5,6,7,8,9,10])); // 25
  print(Solution().maxArea([10,9,8,7,6,5,4,3,2,1])); // 25
}

class Solution {

  int maxArea(final List<int> height) {
    int result = 0;
    int l = 0, r = height.length-1;
    while (l < r) {
      final int area = (r-l) * min(height[l], height[r]);
      if (height[l] < height[r]) {
        l++;
      } else {
        r--;
      }
      result = max(result, area);
    }
    return result;
  }
}
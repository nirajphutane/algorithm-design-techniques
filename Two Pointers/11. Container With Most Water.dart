
import 'dart:math';

void main() {
  print(Solution().maxArea([1,8,6,2,5,4,8,3,7])); // 49
  print(Solution().maxArea([1,1])); // 1
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
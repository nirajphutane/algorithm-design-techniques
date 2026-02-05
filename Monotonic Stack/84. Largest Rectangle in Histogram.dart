
import 'dart:math';

void main() {
  print(Solution().largestRectangleArea([2,1,5,6,2,3]));  // 10
  print(Solution().largestRectangleArea([2,4]));  // 4

  print(Solution().largestRectangleArea([2]));   // 2
  print(Solution().largestRectangleArea([2, 1, 2]));   // 3
}


class Solution {

  int largestRectangleArea(final List<int> heights) {
    int area = 0;

    final List<int> monotonicStack = [];
    for (int i = 0; i <= heights.length; i++) {
      while (monotonicStack.isNotEmpty && (i == heights.length || heights[monotonicStack.last] >= heights[i])) {
        final int height = heights[monotonicStack.removeLast()];
        // final int width = monotonicStack.isNotEmpty? (i - monotonicStack.last) - 1: i;
        final int width = monotonicStack.isNotEmpty? i - (monotonicStack.last + 1): i;
        area = max(area, height * width);
      }
      monotonicStack.add(i);
    }

    return area;
  }
}
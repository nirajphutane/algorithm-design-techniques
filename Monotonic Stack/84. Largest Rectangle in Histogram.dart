
import 'dart:math';

void main() {
  print(Solution().largestRectangleArea([2,1,5,6,2,3]));  // 10
  print(Solution().largestRectangleArea([2,4]));  // 4

  print(Solution().largestRectangleArea([]));                  // 0
  print(Solution().largestRectangleArea([0]));                 // 0
  print(Solution().largestRectangleArea([0,1,0,1,0]));         // 1
  print(Solution().largestRectangleArea([2]));                 // 2
  print(Solution().largestRectangleArea([2,1,2]));             // 3
  print(Solution().largestRectangleArea([2,1,2,3,1]));         // 5
  print(Solution().largestRectangleArea([1,2,3,2,1]));         // 6
  print(Solution().largestRectangleArea([1,1,1,1,1,1,1]));     // 7
  print(Solution().largestRectangleArea([2,2,2,2]));           // 8
  print(Solution().largestRectangleArea([2,3,4,5,1]));         // 9
  print(Solution().largestRectangleArea([5,4,3,2,1]));         // 9
  print(Solution().largestRectangleArea([1,2,3,4,5]));         // 9
  print(Solution().largestRectangleArea([2,1,5,6,2,3,1]));     // 10
  print(Solution().largestRectangleArea([6,2,5,4,5,1,6]));     // 12
  print(Solution().largestRectangleArea([1000,1000,1000]));    // 3000
}

class Solution {

  int largestRectangleArea(final List<int> heights) {
    int area = 0;

    final List<int> monotonicStack = [];
    for (int i = 0; i <= heights.length; i++) {
      while (monotonicStack.isNotEmpty && (i == heights.length || heights[monotonicStack.last] >= heights[i])) {
        final int height = heights[monotonicStack.removeLast()];
        final int width = monotonicStack.isNotEmpty? i - monotonicStack.last - 1: i;
        // final int width = monotonicStack.isNotEmpty? i - (monotonicStack.last + 1): i;
        area = max(area, height * width);
      }
      monotonicStack.add(i);
    }

    return area;
  }
}
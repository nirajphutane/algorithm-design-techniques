
import 'dart:collection';

void main(final List<String> args) {
  print(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)); // [3,3,5,5,6,7]
  print(Solution().maxSlidingWindow([1], 1)); // [1]

  print(Solution().maxSlidingWindow([1,2], 1)); // [1,2]
  print(Solution().maxSlidingWindow([1,2], 2)); // [2]
  print(Solution().maxSlidingWindow([1,3,1,2,0,5], 3)); // [3,3,2,5]
  print(Solution().maxSlidingWindow([1,2,3,4,5,6], 2)); // [2,3,4,5,6]
  print(Solution().maxSlidingWindow([1,2,3,4,5], 3)); // [3,4,5]
  print(Solution().maxSlidingWindow([9,8,7,6,5], 2)); // [9,8,7,6]
  print(Solution().maxSlidingWindow([9,8,7,6,5], 3)); // [9,8,7]
  print(Solution().maxSlidingWindow([5,5,5,5], 2)); // [5,5,5]
  print(Solution().maxSlidingWindow([7,7,7], 3)); // [7]
  print(Solution().maxSlidingWindow([-1,-3,-5,-2,-1], 2)); // [-1,-3,-2,-1]
  print(Solution().maxSlidingWindow([-4,-2,-7,-1,-3], 3)); // [-2,-1,-1]
  print(Solution().maxSlidingWindow([-2,1,-3,5,-1,4], 2)); // [1,1,5,5,4]
  print(Solution().maxSlidingWindow([4,-2,3,-1,5,-3,6], 3)); // [4,3,5,5,6]
  print(Solution().maxSlidingWindow([1,3,1,3,1,3], 3)); // [3,3,3,3]
  print(Solution().maxSlidingWindow([2,1,2,1,2], 2)); // [2,2,2,2]
  print(Solution().maxSlidingWindow([9], 1)); // [9]
  print(Solution().maxSlidingWindow([2,4], 1)); // [2,4]
  print(Solution().maxSlidingWindow([2,4], 2)); // [4]
  print(Solution().maxSlidingWindow([10,6,9,2], 1)); // [10,6,9,2]
  print(Solution().maxSlidingWindow([10,6,9,2], 2)); // [10,9,9]
  print(Solution().maxSlidingWindow([10,6,9,2], 3)); // [10,9]
  print(Solution().maxSlidingWindow([10,6,9,2], 4)); // [10]
  print(Solution().maxSlidingWindow([1,1,1,100,1,1], 3)); // [1, 100, 100, 100]
  print(Solution().maxSlidingWindow([5,3,8,2,6,1], 2)); // [5,8,8,6,6]
  print(Solution().maxSlidingWindow([1,3,2,4,3,5], 2)); // [3,3,4,4,5]
  print(Solution().maxSlidingWindow([1,3,2,4,3,5], 3)); // [3,4,4,5]
}

class Solution {
  List<int> maxSlidingWindow(final List<int> nums, final int k) {
    final List<int> result = List.filled(nums.length-k+1, 0);

    final Queue<int> deQueue = Queue();
    for (int i = 0; i < k; i++) {
      while (deQueue.isNotEmpty && nums[deQueue.last] <= nums[i]) {
        deQueue.removeLast();
      }
      deQueue.addLast(i);
    }

    for (int i = k; i < nums.length; i++) {
      result[i-k] = nums[deQueue.first];

      if (deQueue.first <= i-k) {
        deQueue.removeFirst();
      }

      while (deQueue.isNotEmpty && nums[deQueue.last] <= nums[i]) {
        deQueue.removeLast();
      }
      deQueue.addLast(i);
    }

    result.last = nums[deQueue.first];

    return result;
  }
}

void main(final List<String> args) {
  print(Solution().nextGreaterElements([1,2,1]));  // [2,-1,2]
  print(Solution().nextGreaterElements([1,2,3,4,3]));  // [2,3,4,-1,4]
  print(Solution().nextGreaterElements([3,6,5,4,2]));  // [6,-1,6,6,3]

  print(Solution().nextGreaterElements([5,4,3,2,1]));      // [-1,5,5,5,5]
  print(Solution().nextGreaterElements([1,1,1,1]));        // [-1,-1,-1,-1]
  print(Solution().nextGreaterElements([2,1,2,4,3]));      // [4,2,4,-1,4]
  print(Solution().nextGreaterElements([1]));              // [-1]
  print(Solution().nextGreaterElements([1,3,2,4]));        // [3,4,4,-1]
  print(Solution().nextGreaterElements([4,3,2,1,5]));      // [5,5,5,5,-1]
}

class Solution {

  List<int> nextGreaterElements(final List<int> nums) {
    final List<int> result = List<int>.filled(nums.length, -1);

    final List<int> stack = [];
    for (int i = (nums.length * 2)-1; i >= 0; i--) {
      final int idx = i % nums.length;
      while (stack.isNotEmpty && stack.last <= nums[idx]) {
        stack.removeLast();
      }

      if (stack.isNotEmpty) result[idx] = stack.last;
      stack.add(nums[idx]);
    }

    return result;
  }

  // List<int> nextGreaterElements(final List<int> nums) {
  //   final List<int> result = List<int>.filled(nums.length, -1);
  //
  //   final List<int> monotonicStack = [];
  //   for (int i = (2 * nums.length)-1; i >= 0; i--) {
  //
  //     final int index = i % nums.length;
  //
  //     while (monotonicStack.isNotEmpty && nums[monotonicStack.last] <= nums[index]) {
  //       monotonicStack.removeLast();
  //     }
  //
  //     // if (monotonicStack.isNotEmpty) {
  //     //   result[index] = nums[monotonicStack.last];
  //     // } else {
  //     //   result[index] = -1;
  //     // }
  //
  //     if (i < nums.length) {
  //       if (monotonicStack.isNotEmpty) {
  //         result[index] = nums[monotonicStack.last];
  //       } /*else {
  //         result[index] = -1;
  //       }*/
  //     }
  //
  //     monotonicStack.add(index);
  //   }
  //
  //   return result;
  // }
}
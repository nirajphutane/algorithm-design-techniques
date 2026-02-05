
void main(final List<String> args) {
  print(Solution().nextGreaterElement([6, 8, 0, 1, 3]));  // [8, -1, 1, 3, -1]
  print(Solution().nextGreaterElement([2, 3, 1]));  // [3, -1, -1]
  print(Solution().nextGreaterElement([1, 3, 2]));  // [3, -1, -1]
  print(Solution().nextGreaterElement([5, 4, 3, 6, 1]));  // [6, 6, 6, -1, -1]
  print(Solution().nextGreaterElement([1, 2, 3, 1, 2]));  // [2, 3, -1, 2, -1]
  print(Solution().nextGreaterElement([9, 8, 7, 3, 10])); // [10, 10, 10, 10, -1]
  print(Solution().nextGreaterElement([4, 4, 4]));  // [-1, -1, -1]
  print(Solution().nextGreaterElement([2, 1, 2, 4, 3]));  // [4, 2, 4, -1, -1]
}

class Solution {
  List<int> nextGreaterElement(final List<int> nums) {
    final List<int> result = List.filled(nums.length, -1);

    final List<int> monotonicStack = [];
    for (int i = nums.length-1; i >= 0; i--) {
      while (monotonicStack.isNotEmpty && monotonicStack.last <= nums[i]) {
        monotonicStack.removeLast();
      }

      if (monotonicStack.isNotEmpty) {
        result[i] = monotonicStack.last;
      } /*else {
        result[i] = -1;
      }*/

      monotonicStack.add(nums[i]);
    }

    return result;
  }
}
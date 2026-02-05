
void main(final List<String> args) {
  print(Solution().nextGreaterElement([4,1,2], [1,3,4,2])); // [-1,3,-1]
  print(Solution().nextGreaterElement([2,4], [1,2,3,4])); // [3,-1]

  print(Solution().nextGreaterElement([1], [1])); // [-1]
  print(Solution().nextGreaterElement([3], [1,2,3])); // [-1]
  print(Solution().nextGreaterElement([1,3], [3,1,2])); // [2, -1]
  print(Solution().nextGreaterElement([2,1], [1,2,3])); // [3,2]
  print(Solution().nextGreaterElement([1,2,3], [1,2,3,4])); // [2,3,4]
  print(Solution().nextGreaterElement([4,3,2,1], [1,2,3,4])); // [-1, 4, 3, 2]
  print(Solution().nextGreaterElement([2,3,1], [2,1,3])); // [3,-1,3]
  print(Solution().nextGreaterElement([5], [5,4,3,2,1])); // [-1]
}

class Solution {

  List<int> nextGreaterElement(final List<int> nums1, final List<int> nums2) {
    final List<int> result = List.filled(nums1.length, -1);

    final Map<int, int> map = {};
    for (int i = 0; i < nums1.length; i++) {
      map[nums1[i]] = i;
    }

    final List<int> stack = [];
    for (int i = 0; i < nums2.length-1; i++) {
      while (stack.isNotEmpty && stack.last <= nums2[i]) {
        result[map[stack.removeLast()]!] = nums2[i];
      }

      if (map.containsKey(nums2[i])) stack.add(nums2[i]);
    }

    return result;
  }

  // List<int> nextGreaterElement(final List<int> nums1, final List<int> nums2) {
  //
  //   final Map<int, int> map = {};
  //   final List<int> monotonicStack = [];
  //   for (int i = nums2.length-1; i >= 0; i--) {
  //
  //     while (monotonicStack.isNotEmpty && monotonicStack.last <= nums2[i]) {
  //       monotonicStack.removeLast();
  //     }
  //
  //     if (monotonicStack.isNotEmpty) {
  //       map[nums2[i]] = monotonicStack.last;
  //     } else {
  //       map[nums2[i]] = -1;
  //     }
  //
  //     monotonicStack.add(nums2[i]);
  //   }
  //
  //   final List<int> result = List<int>.filled(nums1.length, -1);
  //   for (int i = 0; i < nums1.length; i++) {
  //     result[i] = map[nums1[i]]!;
  //   }
  //   return result;
  // }
}

void main(final List<String> args) {
  print(Solution().checkSubarraySum([23,2,4,6,7], 6));  // true
  print(Solution().checkSubarraySum([23,2,6,4,7], 13)); // false

  print(Solution().checkSubarraySum([5,0], 5));               // true
  print(Solution().checkSubarraySum([0,0], 7));               // true
  print(Solution().checkSubarraySum([0,0,0], 3));             // true
  print(Solution().checkSubarraySum([-1,2,9], 2));            // true
  print(Solution().checkSubarraySum([5,-5], 5));              // true
  print(Solution().checkSubarraySum([-2,-2], 4));             // true
  print(Solution().checkSubarraySum([-1,-1,-1], 3));          // true
  print(Solution().checkSubarraySum([-1,1], 1));              // true
  print(Solution().checkSubarraySum([1,-1,5], 3));            // true
  print(Solution().checkSubarraySum([2,-2,2,-2], 2));         // true
  print(Solution().checkSubarraySum([4,-1,-3,7], 3));         // true
  print(Solution().checkSubarraySum([10,-3,-7,20,-10], 10));  // true
  print(Solution().checkSubarraySum([1,2,3], 6));             // true
  print(Solution().checkSubarraySum([1,2,3], 3));             // true
  print(Solution().checkSubarraySum([2,4,3], 6));             // true
  print(Solution().checkSubarraySum([6,3,1,2], 3));           // true
  print(Solution().checkSubarraySum([1000000000,1000000000], 1000000000)); // true
  print(Solution().checkSubarraySum([5], 5));                 // false
  print(Solution().checkSubarraySum([0,1,0], 2));             // false
  print(Solution().checkSubarraySum([0], 3));                 // false
  print(Solution().checkSubarraySum([1000000000], 100));      // false
}

class Solution {

  bool checkSubarraySum(final List<int> nums, final int k) {
    final int minLen = 2;
    final Map<int, int> map = {0: 1-minLen};
    int prefixSum = 0;

    for (int i = 0; i < nums.length; i++) {
      prefixSum += nums[i];
      final int reminder = prefixSum % k;

      if (map.containsKey(reminder)) {
        if (i - map[reminder]! >= minLen) {
          return true;
        }
      } else {
        map[reminder] = i;
      }
    }

    return false;
  }
}
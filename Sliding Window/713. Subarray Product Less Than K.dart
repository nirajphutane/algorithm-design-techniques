
void main(final List<String> args) {
  print(Solution().numSubarrayProductLessThanK([10,5,2,6], 100)); // 8
  print(Solution().numSubarrayProductLessThanK([1,2,3], 0)); // 0

  print(Solution().numSubarrayProductLessThanK([1], 2)); // 1
  print(Solution().numSubarrayProductLessThanK([1], 1)); // 0
  print(Solution().numSubarrayProductLessThanK([1,1,1], 2)); // 6
  print(Solution().numSubarrayProductLessThanK([1,1,1], 1)); // 0
  print(Solution().numSubarrayProductLessThanK([2,5,3,10], 30)); // 6
  print(Solution().numSubarrayProductLessThanK([4,3,2,1], 10)); // 7
  print(Solution().numSubarrayProductLessThanK([100,200,300], 50)); // 0
  print(Solution().numSubarrayProductLessThanK([1,2,3,4], 10)); // 7
  print(Solution().numSubarrayProductLessThanK([3,3,3], 28)); // 6
}

class Solution {

  int numSubarrayProductLessThanK(final List<int> nums, final int k) {
    int count = 0, product = 1;

    for (int l = 0, r = 0; r < nums.length; r++) {

      product *= nums[r];
      while (product >= k && l <= r) {
        product ~/= nums[l++];
      }

      count += (r-l+1);
    }

    return count;
  }
}
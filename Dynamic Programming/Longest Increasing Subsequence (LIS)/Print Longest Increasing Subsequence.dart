
void main(final List<String> args) {
  print(Solution().lengthOfLIS([10,9,2,5,3,7,101,18])); // [2, 5, 7, 101]
  print(Solution().lengthOfLIS([0,1,0,3,2,3])); // [0, 1, 2, 3]
  print(Solution().lengthOfLIS([7,7,7,7,7,7,7])); // [7]

  print(Solution().lengthOfLIS([1])); // [1]
  print(Solution().lengthOfLIS([1,2,3,4,5])); // [1, 2, 3, 4, 5]
  print(Solution().lengthOfLIS([5,4,3,2,1])); // [1]
  print(Solution().lengthOfLIS([3,1,2])); // [1, 2]
  print(Solution().lengthOfLIS([1,3,6,7,9,4,10,5,6])); // [1, 3, 6, 7, 9, 10]
  print(Solution().lengthOfLIS([-1,3,4,5,2,2,2,2])); // [-1, 3, 4, 5]
  print(Solution().lengthOfLIS([4,10,4,3,8,9])); // [4, 8, 9]
  print(Solution().lengthOfLIS([1,5,2,3,4])); // [1, 2, 3, 4]
  print(Solution().lengthOfLIS([2,2,2,2,2]));// [2]
}

class Solution {

  List<int> lengthOfLIS(final List<int> nums) {
    int lis = 1, lastLis = nums.length-1;

    final List<int> dp = List<int>.filled(nums.length, 1);
    final List<int> dpMapper = List<int>.filled(nums.length, -1);

    for (int current = 1; current < nums.length; current++) {
      for (int previous = 0; previous < current; previous++) {
        if (nums[previous] < nums[current] && dp[current] < dp[previous]+1) {
          dp[current] = dp[previous]+1;
          dpMapper[current] = previous;

          if (lis < dp[current]) {
            lis = dp[current];
            lastLis = current;
          }
        }
      }
    }

    final List<int> result = List<int>.filled(lis, -1);
    while (lis > 0) {
      result[--lis] = nums[lastLis];
      lastLis = dpMapper[lastLis];
    }

    return result;
  }
}
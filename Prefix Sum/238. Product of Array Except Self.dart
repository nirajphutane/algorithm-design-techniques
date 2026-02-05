
void main(final List<String> args) {
  print(Solution().productExceptSelf([1,2,3,4]));  // [24,12,8,6]
  print(Solution().productExceptSelf([-1,1,0,-3,3]));  // [0,0,9,0,0]
}

class Solution {
  List<int> productExceptSelf(final List<int> nums) {
    final List<int> result = List.filled(nums.length, 1);

    for (int i = 1; i < nums.length; i++) {
      result[i] = result[i-1] * nums[i-1];
    }

    int suffix = 1;
    for (int i = nums.length-2; i >= 0; i--) {
      suffix *= nums[i+1];
      result[i] *= suffix;
    }

    return result;
  }

  // Brute-Force Approach
  // List<int> productExceptSelf(final List<int> nums) {
  //
  //   final List<int> result = List.filled(nums.length, 1);
  //   for (int i = 0; i < nums.length; i++) {
  //     for (int j = 0; j < nums.length; j++) {
  //       if (i != j) {
  //         result[i] *= nums[j];
  //       }
  //     }
  //   }
  //
  //   return result;
  // }
}

void main(final List<String> args) {
  print(Solution().printMaxSubArray([-2,1,-3,4,-1,2,1,-5,4])); // [4, -1, 2, 1]
  print(Solution().printMaxSubArray([1])); // [1]
  print(Solution().printMaxSubArray([5,4,-1,7,8])); // [5, 4, -1, 7, 8]

  print(Solution().printMaxSubArray([1]));            // [1]
  print(Solution().printMaxSubArray([-1]));           // [-1]
  print(Solution().printMaxSubArray([0]));            // [0]
  print(Solution().printMaxSubArray([1,2,3,4,5]));    // [1,2,3,4,5]
  print(Solution().printMaxSubArray([5,4,3,2,1]));    // [5,4,3,2,1]
  print(Solution().printMaxSubArray([-1,-2,-3,-4]));  // [-1]
  print(Solution().printMaxSubArray([-5,-1,-8,-9]));  // [-1]
  print(Solution().printMaxSubArray([-2,1,-3,4,-1,2,1,-5,4])); // [4,-1,2,1]
  print(Solution().printMaxSubArray([5,4,-1,7,8]));           // [5,4,-1,7,8]
  print(Solution().printMaxSubArray([1,-3,2,1,-1]));          // [2,1]
  print(Solution().printMaxSubArray([0,0,0]));          // [0, 0, 0]
  print(Solution().printMaxSubArray([-1,0,-2]));        // [0]
  print(Solution().printMaxSubArray([0,1,0,3,0]));      // [0,1,0,3,0]
  print(Solution().printMaxSubArray([5,4,-10,1,2]));    // [5,4]
  print(Solution().printMaxSubArray([-10,1,2,3]));      // [1,2,3]
  print(Solution().printMaxSubArray([1,-1,1,-1,1]));    // [1]
  print(Solution().printMaxSubArray([100,-90,50,-10,60])); // [100, -90, 50, -10, 60]
  print(Solution().printMaxSubArray([3,-100,4,5]));     // [4,5]
  print(Solution().printMaxSubArray([2,-1,2,-1,2])); // [2, -1, 2, -1, 2]
  print(Solution().printMaxSubArray([1,-2,3,-2,5,-3])); // [3,-2,5]
  print(Solution().printMaxSubArray([2,2,2,2]));        // [2,2,2,2]
  print(Solution().printMaxSubArray([1000000,-1,1000000])); // [1000000,-1,1000000]
  print(Solution().printMaxSubArray([-2,-2,-2]));       // [-2]
  print(Solution().printMaxSubArray([0,-1,0]));         // [0]
}

class Solution {
  List<int> printMaxSubArray(final List<int> nums) {

    int maxSum = nums.first, sum = nums.first, tmpStart = 0, start = 0, end = 0;

    for (int i = 1; i < nums.length; i++) {

      sum += nums[i];

      if (maxSum < sum) {
        maxSum = sum;
        start = tmpStart;
        end = i;
      }

      if (sum.isNegative) {
        sum = 0;
        tmpStart = i + 1;
      }
    }

    return nums.sublist(start, end + 1);
  }
}

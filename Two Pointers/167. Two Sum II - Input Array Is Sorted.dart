
void main(final List<String> args) {
  print(Solution().twoSum([2,7,11,15], 9));  // [1,2]
  print(Solution().twoSum([2,3,4], 6));  // [1,3]
  print(Solution().twoSum([-1,0], -1));  // [1,2]

  print(Solution().twoSum([1,2,3,4,5], 9));       // [4,5]
  print(Solution().twoSum([1,1,2,2,3,3], 4));     // [1,6]
  print(Solution().twoSum([0,0,3,4], 0));         // [1,2]
  print(Solution().twoSum([-10,-5,-2,-1], -7));   // [2,3]
  print(Solution().twoSum([1,2], 3));             // [1,2]
  print(Solution().twoSum([1,2,3,4,4,9,56,90], 8)); // [4,5]
  print(Solution().twoSum([5,25,75], 100));       // [2,3]
  print(Solution().twoSum([1,3,5,7,9], 12));       // [2,5]
  print(Solution().twoSum([-3,-1,0,2,4,5], 1));    // [1,5]
  print(Solution().twoSum([-5,-3,-1,0,1,3,5], 0)); // [1,7]
}

class Solution {

  List<int> twoSum(final List<int> numbers, final int target) {
    int l = 0, r = numbers.length-1;
    while(l < r) {
      final int sum = (numbers[l] + numbers[r]);

      if (sum == target) {
        break;
      }

      if (sum > target) {
        r--;
      } else {
        l++;
      }
    }

    return [l+1, r+1];
  }
}

void main(final List<String> args) {
  print(Solution().twoSum([2,7,11,15], 9));  // [1,2]
  print(Solution().twoSum([2,3,4], 6));  // [1,3]
  print(Solution().twoSum([-1,0], -1));  // [1,2]
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
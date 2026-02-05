
void main(final List<String> args) {
  List<int> list = [0,1,0,3,12];
  Solution().moveZeroes(list);
  print(list); // [1,3,12,0,0]

  list = [0];
  Solution().moveZeroes(list);
  print(list); // [0]
}

class Solution {

  void moveZeroes(final List<int> nums) {
    for (int l = 0, r = 0; r < nums.length; r++) {
      if (nums[r] != 0) {
        final int tmp = nums[r];
        nums[r] = nums[l];
        nums[l] = tmp;
        l++;
      }
    }
  }
}
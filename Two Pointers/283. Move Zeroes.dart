
void main(final List<String> args) {
  List<int> list = [0,1,0,3,12];
  Solution().moveZeroes(list);
  print(list); // [1,3,12,0,0]

  list = [0];
  Solution().moveZeroes(list);
  print(list); // [0]

  list = [1,2,3,0,0,0];
  Solution().moveZeroes(list);
  print(list); // [1,2,3,0,0,0]

  list = [0,0,1,0,2,0,3];
  Solution().moveZeroes(list);
  print(list); // [1,2,3,0,0,0,0]

  list = [0,0,0,0];
  Solution().moveZeroes(list);
  print(list); // [0,0,0,0]

  list = [1,2,3,4,5];
  Solution().moveZeroes(list);
  print(list); // [1,2,3,4,5]

  list = [0,1,2,3,4];
  Solution().moveZeroes(list);
  print(list); // [1,2,3,4,0]

  list = [1,0,2,0,3,0,4,0,5];
  Solution().moveZeroes(list);
  print(list); // [1,2,3,4,5,0,0,0,0]

  list = [0,1];
  Solution().moveZeroes(list);
  print(list); // [1,0]

  list = [1,0];
  Solution().moveZeroes(list);
  print(list); // [1,0]

  list = [];
  Solution().moveZeroes(list);
  print(list); // []
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
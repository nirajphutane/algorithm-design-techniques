void main(final List<String> args) {
  List<int> nums1 = [1,2,3,0,0,0];
  Solution().merge(nums1, 3, [2,5,6], 3);  // [1,2,2,3,5,6]
  print(nums1);

  nums1 = [2,5,6,0,0,0];
  Solution().merge(nums1, 3, [1, 2, 3], 3);  // [1,2,2,3,5,6]
  print(nums1);

  nums1 = [1];
  Solution().merge(nums1, 1, [], 0); // [1]
  print(nums1);

  nums1 = [0];
  Solution().merge(nums1, 0, [1], 1);  // [1]
  print(nums1);

  nums1 = [0,0,0,0];
  Solution().merge(nums1, 0, [1,2,3,4], 4);  // [1,2,3,4]
  print(nums1);

  nums1 = [1,2,3,0,0,0,0];
  Solution().merge(nums1, 3, [0,4,5,6], 4);  // [0,1,2,3,4,5,6]
  print(nums1);

  nums1 = [1,1,1,0,0,0];
  Solution().merge(nums1, 3, [1,1,1], 3);    // [1,1,1,1,1,1]
  print(nums1);

  nums1 = [5,6,7,0,0,0];
  Solution().merge(nums1, 3, [1,2,3], 3);    // [1,2,3,5,6,7]
  print(nums1);

  nums1 = [1,3,5,0,0,0,0];
  Solution().merge(nums1, 3, [2,4,6,7], 4);  // [1,2,3,4,5,6,7]
  print(nums1);

  nums1 = [0,0,0];
  Solution().merge(nums1, 0, [1,2,3], 3);    // [1,2,3]
  print(nums1);

  nums1 = [1,2,3,0,0,0,0,0];
  Solution().merge(nums1, 3, [1,2,3,4,5], 5); // [1,1,2,2,3,3,4,5]
  print(nums1);
}

class Solution {

  void merge(final List<int> nums1, final int m, final List<int> nums2, final int n) {
    int p = nums1.length-1, p1 = m-1, p2 = n-1;

    while (p1 >= 0 && p2 >= 0) {
      if (nums1[p1] > nums2[p2]) {
        nums1[p--] = nums1[p1--];
      } else {
        nums1[p--] = nums2[p2--];
      }
    }

    while (p2 >= 0) {
      nums1[p--] = nums2[p2--];
    }
  }
}
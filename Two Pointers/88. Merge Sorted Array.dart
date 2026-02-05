void main() {
  List<int> num1 = [1,2,3,0,0,0];
  Solution().merge(num1, 3, [2,5,6], 3);  // [1,2,2,3,5,6]
  print(num1);

  num1 = [2,5,6,0,0,0];
  Solution().merge(num1, 3, [1, 2, 3], 3);  // [1,2,2,3,5,6]
  print(num1);

  num1 = [1];
  Solution().merge(num1, 1, [], 0); // [1]
  print(num1);

  num1 = [0];
  Solution().merge(num1, 0, [1], 1);  // [1]
  print(num1);
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
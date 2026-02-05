
import 'dart:math';


/*void main(final List<String> args) {
  print(Solution().numSubarrayProductLessThanK([10,5,2,6], 100)); // 8
  print(Solution().numSubarrayProductLessThanK([1,2,3], 0)); // 0
}

class Solution {
  int numSubarrayProductLessThanK(final List<int> nums, final int k) {
    int count = 0;
    return count;
  }
}*/

/*void main(final List<String> args) {
  print(Solution().checkInclusion('ab', 'eidbaooo')); // true
  print(Solution().checkInclusion('ab', 'eidboaoo')); // false
  print(Solution().checkInclusion('a', 'a')); // true
  print(Solution().checkInclusion('abc', 'bbbca')); // true
  print(Solution().checkInclusion('adc', 'dcda')); // true
  print(Solution().checkInclusion('adc', 'dddac')); // true
  print(Solution().checkInclusion('hello', 'llehoabc')); // true
  print(Solution().checkInclusion('xyz', 'afxyzzgba')); // true
  print(Solution().checkInclusion('abcd', 'dcba')); // true
  print(Solution().checkInclusion('abcd', 'cabd')); // true
  print(Solution().checkInclusion('aaa', 'aaaaaa')); // true
  print(Solution().checkInclusion('abc', 'bac')); // true
  print(Solution().checkInclusion('abc', 'bca')); // true
  print(Solution().checkInclusion('', 'abcdef')); // true
  print(Solution().checkInclusion('', '')); // true
  print(Solution().checkInclusion('ab', 'aab'));  // true
  print(Solution().checkInclusion("adc", "dddac")); // true

  print(Solution().checkInclusion('a', 'b')); // false
  print(Solution().checkInclusion('abc', 'ccccbbbba')); // false
  print(Solution().checkInclusion('adc', 'dddddddd')); // false
  print(Solution().checkInclusion('hello', 'ooolleoooleh')); // false
  print(Solution().checkInclusion('xyz', 'aaaxbycz')); // false
  print(Solution().checkInclusion('abcd', 'abc')); // false
  print(Solution().checkInclusion('aaa', 'abcabc')); // false
  print(Solution().checkInclusion('abc', 'defghijkl')); // false
  print(Solution().checkInclusion('ab', '')); // false
  print(Solution().checkInclusion('aaa', 'aabaa')); // false
  print(Solution().checkInclusion('abc', 'bbbcccaaa')); // false
  print(Solution().checkInclusion("aaa", "aabaa")); // false
  print(Solution().checkInclusion("abc", "bbbcccaaa")); // false
}

class Solution {
  bool checkInclusion(final String str1, final String str2) {
    return false;
  }
}*/

// void main(final List<String> args) {
//   print(Solution().findMaxAverage([1,12,-5,-6,50,3], 4)); // 12.75000
//   print(Solution().findMaxAverage([5], 1)); // 5.00000
//
//   print(Solution().findMaxAverage([-3, -1, -2], 2));  // -1.5
//   print(Solution().findMaxAverage([-5, -6, -1, -4], 2));  // -2.5
//   print(Solution().findMaxAverage([-10, 1, 2, 3, 4], 2));  // 3.5
//   print(Solution().findMaxAverage([100, -50, -50, -50], 3));  // 0.0
//   print(Solution().findMaxAverage([-8, -7, -6, -5], 3));  // -6.0
//   print(Solution().findMaxAverage([-1, -2, -3, -4, -5], 5));  // -3.0
//   print(Solution().findMaxAverage([-1, -2, 10], 3));  // 7/3 = 2.3333333
//   print(Solution().findMaxAverage([0, -1, -2, -3], 2));  // -0.5
//   print(Solution().findMaxAverage([-100, 50], 2));  // -25.0
//   print(Solution().findMaxAverage([50, -100], 2));  // -25.0
//   print(Solution().findMaxAverage([-4, -4, -4, -4], 4));  // -4.0
//   print(Solution().findMaxAverage([-2, 100], 1));  // 100.0
//   print(Solution().findMaxAverage([-2, -1, 100], 2));  // 49.5
// }
//
// class Solution {
//
//   double findMaxAverage(final List<int> nums, final int k) {
//     int sum = nums.first, maxSum;
//     for (int i = 1; i < k; i++) {
//       sum += nums[i];
//     }
//     maxSum = sum;
//     for (int i = k; i < nums.length; i++) {
//       sum -= nums[i-k];
//       sum += nums[i];
//       maxSum = max(maxSum, sum);
//     }
//     return maxSum/k;
//   }
// }

/*
void main(final List<String> args) {
  print(Solution().minWindow('ADOBECODEBANC', 'ABC'));  // BANC
  print(Solution().minWindow('a', 'a')); // a
  print(Solution().minWindow('a', 'aa')); // ''
  print(Solution().minWindow('aa', 'aa'));	// aa
  print(Solution().minWindow('aaflslflsldkabc', 'abc'));	// abc
  print(Solution().minWindow('ab', 'A'));	// ''
  print(Solution().minWindow('ab', 'b'));	// b
  print(Solution().minWindow('bba', 'ab'));	// ba
  print(Solution().minWindow('cabwefgewcwaefgcf', 'cae'));	// cwae
  print(Solution().minWindow('aaaaaaaaaaaabbbbbcdd', 'abcdd'));	// abbbbbcdd
  print(Solution().minWindow('XYZ', 'Z'));	// Z
  print(Solution().minWindow('XYZ', 'XYZZ'));	// ''
  print(Solution().minWindow('', 'A'));	// ''
  print(Solution().minWindow('A', ''));	// ''
  print(Solution().minWindow('ab', 'ab'));           // ab
  print(Solution().minWindow('zzzzabc', 'abc'));     // abc
  print(Solution().minWindow('xaybz', 'ab'));        // ayb
  print(Solution().minWindow('aabcab', 'abc'));      // abc
  print(Solution().minWindow('aaabbbc', 'abc'));     // abbbc
  print(Solution().minWindow('dddddddaecb', 'abc')); // aecb
}

class Solution {
  String minWindow(final String s, final String t) {
    String result = '';
    return result;
  }
}
*/

/*
void main(final List<String> args) {;
print(Solution().characterReplacement('ABAB', 2));  // 4
print(Solution().characterReplacement('AABABBA', 1)); // 4

print(Solution().characterReplacement('AAAA', 2)); // 4
print(Solution().characterReplacement('BBBBBB', 1)); // 6
print(Solution().characterReplacement('ABCDE', 1)); // 2
print(Solution().characterReplacement('ABCDE', 2)); // 3
print(Solution().characterReplacement('ABCDE', 4)); // 5
print(Solution().characterReplacement('AABABBA', 0)); // 2
print(Solution().characterReplacement('AABABBA', 2)); // 5
print(Solution().characterReplacement('ABBB', 2)); // 4
print(Solution().characterReplacement('BAAAB', 2)); // 5
print(Solution().characterReplacement('BAAAB', 1)); // 4
print(Solution().characterReplacement('ABABABAB', 1)); // 3
print(Solution().characterReplacement('ABABABAB', 2)); // 5
print(Solution().characterReplacement('ABABABAB', 3)); // 7
print(Solution().characterReplacement('ABABABAB', 4)); // 8
print(Solution().characterReplacement('', 5)); // 0
print(Solution().characterReplacement('A', 0)); // 1
print(Solution().characterReplacement('A', 10)); // 1
print(Solution().characterReplacement('XYZXYZXYZ', 1)); // 2
print(Solution().characterReplacement('XYZXYZXYZ', 3)); // 5
print(Solution().characterReplacement('XYZXYZXYZ', 6)); // 9
print(Solution().characterReplacement('AAAAABBBBAAAA', 1)); // 6
print(Solution().characterReplacement('AAAAABBBBAAAA', 5)); // 13
}

class Solution {
  int characterReplacement(final String s, final int k) {
    return -1;
  }
}
*/

/*
void main(final List<String> args) {
  print(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)); // [3,3,5,5,6,7]
  print(Solution().maxSlidingWindow([1], 1)); // [1]
  print(Solution().maxSlidingWindow([1,2], 1)); // [1,2]
  print(Solution().maxSlidingWindow([1,2], 2)); // [2]
  print(Solution().maxSlidingWindow([1,3,1,2,0,5], 3)); // [3,3,2,5]
  print(Solution().maxSlidingWindow([1,2,3,4,5,6], 2)); // [2,3,4,5,6]
  print(Solution().maxSlidingWindow([1,2,3,4,5], 3)); // [3,4,5]
  print(Solution().maxSlidingWindow([9,8,7,6,5], 2)); // [9,8,7,6]
  print(Solution().maxSlidingWindow([9,8,7,6,5], 3)); // [9,8,7]
  print(Solution().maxSlidingWindow([5,5,5,5], 2)); // [5,5,5]
  print(Solution().maxSlidingWindow([7,7,7], 3)); // [7]
  print(Solution().maxSlidingWindow([-1,-3,-5,-2,-1], 2)); // [-1,-3,-2,-1]
  print(Solution().maxSlidingWindow([-4,-2,-7,-1,-3], 3)); // [-2,-1,-1]
  print(Solution().maxSlidingWindow([-2,1,-3,5,-1,4], 2)); // [1,1,5,5,4]
  print(Solution().maxSlidingWindow([4,-2,3,-1,5,-3,6], 3)); // [4,3,5,5,6]
  print(Solution().maxSlidingWindow([1,3,1,3,1,3], 3)); // [3,3,3,3]
  print(Solution().maxSlidingWindow([2,1,2,1,2], 2)); // [2,2,2,2]
  print(Solution().maxSlidingWindow([9], 1)); // [9]
  print(Solution().maxSlidingWindow([2,4], 1)); // [2,4]
  print(Solution().maxSlidingWindow([2,4], 2)); // [4]
  print(Solution().maxSlidingWindow([10,6,9,2], 1)); // [10,6,9,2]
  print(Solution().maxSlidingWindow([10,6,9,2], 2)); // [10,9,9]
  print(Solution().maxSlidingWindow([10,6,9,2], 3)); // [10,9]
  print(Solution().maxSlidingWindow([10,6,9,2], 4)); // [10]
  print(Solution().maxSlidingWindow([1,1,1,100,1,1], 3)); // [1, 100, 100, 100]
  print(Solution().maxSlidingWindow([5,3,8,2,6,1], 2)); // [5,8,8,6,6]
  print(Solution().maxSlidingWindow([1,3,2,4,3,5], 2)); // [3,3,4,4,5]
  print(Solution().maxSlidingWindow([1,3,2,4,3,5], 3)); // [3,4,4,5]
}

class Solution {
  List<int> maxSlidingWindow(final List<int> nums, final int k) {
    return [];
  }
}*/

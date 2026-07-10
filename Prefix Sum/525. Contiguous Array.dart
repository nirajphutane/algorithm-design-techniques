
import 'dart:math';

void main(final List<String> args) {
  print(Solution().findMaxLength([0, 1])); // 2
  print(Solution().findMaxLength([0, 1, 0])); // 2

  print(Solution().findMaxLength([])); // 0
  print(Solution().findMaxLength([0])); // 0
  print(Solution().findMaxLength([1])); // 0
  print(Solution().findMaxLength([0, 0])); // 0
  print(Solution().findMaxLength([1, 1])); // 0
  print(Solution().findMaxLength([0, 0, 0, 0])); // 0
  print(Solution().findMaxLength([1, 1, 1, 1])); // 0
  print(Solution().findMaxLength([1, 0])); // 2
  print(Solution().findMaxLength([0, 1, 1, 0])); // 4
  print(Solution().findMaxLength([0, 0, 1, 1])); // 4
  print(Solution().findMaxLength([1, 1, 0, 0])); // 4
  print(Solution().findMaxLength([0, 1, 0, 1])); // 4
  print(Solution().findMaxLength([0, 1, 1, 1, 0, 0])); // 6
  print(Solution().findMaxLength([1, 0, 1, 0, 1, 0])); // 6
  print(Solution().findMaxLength([0, 0, 1, 0, 1, 1, 0, 1])); // 8
}

class Solution {
  int findMaxLength(final List<int> nums) {
    int balance = 0, maxLength = 0;
    final Map<int, int> firstIndex = { balance: -1 };

    for (int i = 0; i < nums.length; i++) {
      balance += nums[i] == 1? 1: -1;

      if (firstIndex.containsKey(balance)) {
        maxLength = max(maxLength, i - firstIndex[balance]!);
      } else {
        firstIndex[balance] = i;
      }
    }

    return maxLength;
  }
}
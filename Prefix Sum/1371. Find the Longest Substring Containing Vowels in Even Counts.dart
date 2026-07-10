
import 'dart:math';

void main(final List<String> args) {
  print(Solution().findTheLongestSubstring('eleetminicoworoep')); // 13
  print(Solution().findTheLongestSubstring('leetcodeisgreat')); // 5
  print(Solution().findTheLongestSubstring('bcbcbc')); // 6
  
  print(Solution().findTheLongestSubstring('')); // 0
  print(Solution().findTheLongestSubstring('a')); // 0
  print(Solution().findTheLongestSubstring('e')); // 0
  print(Solution().findTheLongestSubstring('i')); // 0
  print(Solution().findTheLongestSubstring('o')); // 0
  print(Solution().findTheLongestSubstring('u')); // 0
  print(Solution().findTheLongestSubstring('ae')); // 0
  print(Solution().findTheLongestSubstring('ab')); // 1
  print(Solution().findTheLongestSubstring('aeiouu')); // 2
  print(Solution().findTheLongestSubstring('aa')); // 2
  print(Solution().findTheLongestSubstring('abcde')); // 3
  print(Solution().findTheLongestSubstring('aba')); // 3
  print(Solution().findTheLongestSubstring('bbbb')); // 4
  print(Solution().findTheLongestSubstring('aaaa')); // 4
  print(Solution().findTheLongestSubstring('aeae')); // 4
  print(Solution().findTheLongestSubstring('aeiouaeiou')); // 10
}

class Solution {
  int findTheLongestSubstring(final String s) {
    int prefix = 0, maxLength = 0;
    final Map<int, int> firstIndex = { prefix: -1 };

    for (int i = 0; i < s.length; i++) {

      prefix ^= switch (s[i]) {
        'a' => 1 << 0,
        'e' => 1 << 1,
        'i' => 1 << 2,
        'o' => 1 << 3,
        'u' => 1 << 4,
         _ => 0
      };

      if (firstIndex.containsKey(prefix)) {
        maxLength = max(maxLength, i - firstIndex[prefix]!);
      } else {
        firstIndex[prefix] = i;
      }
    }

    return maxLength;
  }
}
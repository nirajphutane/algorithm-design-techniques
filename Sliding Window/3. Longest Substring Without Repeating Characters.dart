
import 'dart:math';

void main() {
  print(Solution().lengthOfLongestSubstring('abcabcbb')); // 3
  print(Solution().lengthOfLongestSubstring('bbbbb'));  // 1
  print(Solution().lengthOfLongestSubstring('pwwkew')); // 3

  print(Solution().lengthOfLongestSubstring(''));         // 0
  print(Solution().lengthOfLongestSubstring('a'));        // 1
  print(Solution().lengthOfLongestSubstring(' '));        // 1
  print(Solution().lengthOfLongestSubstring('  '));       // 1
  print(Solution().lengthOfLongestSubstring('au'));       // 2
  print(Solution().lengthOfLongestSubstring('aab'));      // 2
  print(Solution().lengthOfLongestSubstring('abba'));     // 2
  print(Solution().lengthOfLongestSubstring('dvdf'));     // 3
  print(Solution().lengthOfLongestSubstring('a b c a'));  // 3
  print(Solution().lengthOfLongestSubstring('anviaj'));   // 5
  print(Solution().lengthOfLongestSubstring('tmmzuxt'));  // 5
  print(Solution().lengthOfLongestSubstring('abcdef'));   // 6
  print(Solution().lengthOfLongestSubstring('abcABC123'));// 9
  print(Solution().lengthOfLongestSubstring('!@#%^&*()'));// 9
}

class Solution {

  int lengthOfLongestSubstring(final String word) {
    int size = 0;

    final Set<String> set = {};
    for (int  l = 0, r = 0; r < word.length; r++) {

      while (set.contains(word[r])) {
        set.remove(word[l++]);
      }

      size = max(size, r - l + 1);

      set.add(word[r]);
    }

    return size;
  }
}
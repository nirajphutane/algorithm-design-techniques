
import 'dart:math';

void main() {
  print(Solution().lengthOfLongestSubstring('abcabcbb')); // 3
  print(Solution().lengthOfLongestSubstring('bbbbb'));  // 1
  print(Solution().lengthOfLongestSubstring('pwwkew')); // 3
}

class Solution {

  int lengthOfLongestSubstring(final String word) {
    int result = 0;
    final Map<String, int> frequencies = {};
    for (int i = 0; i < word.length; i++) {
      if (frequencies.containsKey(word[i])) {
        result = max(result, i-frequencies[word[i]]!);
      }
      frequencies[word[i]] = i;
    }
    return result;
  }

  // int lengthOfLongestSubstring(final String word) {
  //   int result = 0;
  //   final Set<String> set = {};
  //   for (int l = 0, r = 0; r < word.length; r++) {
  //     if (set.contains(word[r])) {
  //       result = max(result, r-l);
  //       while (set.contains(word[l])) {
  //         set.remove(word[l++]);
  //       }
  //     }
  //     set.add(word[r]);
  //   }
  //   return result;
  // }
}

import 'dart:math';

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
    int result = 0, maxFrequency = 0;
    final Map<String, int> frequencies = {};
    for (int l = 0, r = 0; r < s.length; r++) {
      frequencies[s[r]] = (frequencies[s[r]]?? 0) + 1;
      maxFrequency = max(maxFrequency, frequencies[s[r]]!);

      while (((r-l+1)-maxFrequency) > k) {
        frequencies[s[l]] = frequencies[s[l]]! - 1;
        l++;
      }

      result = max(result, r-l+1);
    }

    return result;
  }

  // int characterReplacement(final String s, final int k) {
  //   int result = 0;
  //
  //   int maxFrequency = 0;
  //   final Map<String, int> frequency = {};
  //   for (int l = 0, r = 0; r < s.length; r++) {
  //    final String char = s[r];
  //    frequency[char] = (frequency[char]?? 0) + 1;
  //
  //    maxFrequency = max(maxFrequency, frequency[char]!);
  //    while ((r-l+1)-maxFrequency > k) {
  //      final String char = s[l];
  //      frequency[char] = frequency[char]! - 1;
  //      if (frequency[char] == 0) {
  //        frequency.remove(char);
  //      }
  //      l++;
  //    }
  //
  //    result = max(result, r-l+1);
  //  }
  //
  //   return result;
  // }
}

void main(final List<String> args) {
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
  print(Solution().checkInclusion('adc', 'dddac')); // true

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
  print(Solution().checkInclusion('aaa', 'aabaa')); // false
  print(Solution().checkInclusion('abc', 'bbbcccaaa')); // false
}

class Solution {

  bool checkInclusion(final String s1, final String s2) {
    if (s1.length > s2.length) return false;

    final Map<String, int> s1Counts = {};
    for (int i = 0; i < s1.length; i++) {
      s1Counts[s1[i]] = (s1Counts[s1[i]]?? 0) + 1;
    }

    int count = s1Counts.length;
    final Map<String, int> s2Counts = {};
    for (int i = 0; i < s1.length; i++) {
      final String toAdd = s2[i];
      if (s1Counts.containsKey(toAdd)) {
        s2Counts[toAdd] = (s2Counts[toAdd]?? 0) + 1;
        if (s1Counts[toAdd] == s2Counts[toAdd]) {
          count--;
        }
      }
    }

    if (count == 0) {
      return true;
    }

    for (int i = s1.length; i < s2.length; i++) {

      final String toRemove = s2[i-s1.length];
      if (s2Counts.containsKey(toRemove)) {
        if (s1Counts[toRemove] == s2Counts[toRemove]) {
          count++;
        }
        s2Counts[toRemove] = s2Counts[toRemove]! - 1;
      }

      final String toAdd = s2[i];
      if (s1Counts.containsKey(toAdd)) {
        s2Counts[toAdd] = (s2Counts[toAdd]?? 0) + 1;
        if (s1Counts[toAdd] == s2Counts[toAdd]) {
          count--;
        }
      }

      if (count == 0) {
        return true;
      }
    }

    return false;
  }

  // bool checkInclusion(final String s1, final String s2) {
  //   if (s1.length > s2.length) {
  //     return false;
  //   }
  //
  //   final Map<String, int> map = {};
  //   for (int i = 0; i < s1.length; i++) {
  //     map[s1[i]] = (map[s1[i]]?? 0) + 1;
  //   }
  //
  //   int count = 0;
  //   final Map<String, int> window = {};
  //   for (int i = 0; i < s1.length; i++) {
  //     count = _add(map, window, s2[i], count);
  //   }
  //
  //   if (count == map.length) {
  //     return true;
  //   }
  //
  //   for (int r = s1.length; r < s2.length; r++) {
  //     count = _remove(map, window, s2[r-s1.length], count);
  //     count = _add(map, window, s2[r], count);
  //     if (count == map.length) {
  //       return true;
  //     }
  //   }
  //
  //   return false;
  // }
  //
  // int _add(final Map<String, int> map, final Map<String, int> window, final String key, int count) {
  //   if (map.containsKey(key)) {
  //     window[key] = (window[key]?? 0) + 1;
  //     if (map[key] == window[key]) {
  //       count++;
  //     }
  //   }
  //   return count;
  // }
  //
  // int _remove(final Map<String, int> map, final Map<String, int> window, final String key, int count) {
  //   if (window.containsKey(key)) {
  //     if (map[key] == window[key]) {
  //       count--;
  //     }
  //     window[key] = window[key]! - 1;
  //     if (window[key] == 0) {
  //       window.remove(key);
  //     }
  //   }
  //   return count;
  // }
}

// class Solution {
//   bool checkInclusion(final String s1, final String s2) {
//     if (s1.length > s2.length) {
//       return false;
//     }
//
//     final Map<String, int> map = {};
//     final Map<String, int> window = {};
//     for (int i = 0; i < s1.length; i++) {
//       map[s1[i]] = (map[s1[i]]?? 0) + 1;
//       window[s2[i]] = (window[s2[i]]?? 0) + 1;
//     }
//
//     if (_isSame(map, window)) {
//       return true;
//     }
//
//     for (int r = s1.length; r < s2.length; r++) {
//       final int l = r-s1.length;
//       window[s2[l]] = window[s2[l]]! - 1;
//       if (window[s2[l]] == 0) {
//         window.remove(s2[l]);
//       }
//
//       window[s2[r]] = (window[s2[r]]?? 0) + 1;
//
//       if (_isSame(map, window)) {
//         return true;
//       }
//     }
//
//     return false;
//   }
//
//   bool _isSame(final Map<String, int> map, final Map<String, int> window) {
//     for (final String key in map.keys) {
//       if (map[key] != window[key]) {
//         return false;
//       }
//     }
//     return true;
//   }
// }

void main(final List<String> args) {;
  print(Solution().findAnagrams('cbaebabacd', 'abc'));  // [0,6]
  print(Solution().findAnagrams('abab', 'ab')); // [0,1,2]

  print(Solution().findAnagrams('baa', 'aa'));  // [1]
  print(Solution().findAnagrams('aaaaaaaaaa', 'aaa'));  // [0,1,2,3,4,5,6,7]
  print(Solution().findAnagrams('abcdefg', 'hij'));  // []
  print(Solution().findAnagrams('abc', 'abc'));  // [0]
  print(Solution().findAnagrams('abababab', 'aabb'));  // [0, 1, 2, 3, 4]
  print(Solution().findAnagrams('eidbaooo', 'ab'));  // [3]
  print(Solution().findAnagrams('abc', 'abcd'));  // [2]
  print(Solution().findAnagrams('eidboaoo', 'ab'));  // []
}

class Solution {

  List<int> findAnagrams(final String s, final String p) {
    if (p.length > s.length) return [];

    final List<int> result = [];

    final Map<String, int> pCount = {};
    final Map<String, int> sCount = {};
    for (int i = 0; i < p.length; i++) {
      pCount[p[i]] = (pCount[p[i]]?? 0) + 1;
      sCount[s[i]] = (sCount[s[i]]?? 0) + 1;
    }

    if (_isAnagram(pCount, sCount)) result.add(0);

    for (int i = p.length; i < s.length; i++) {
      sCount[s[i-p.length]] = sCount[s[i-p.length]]! - 1;
      sCount[s[i]] = (sCount[s[i]]?? 0) + 1;
      if (_isAnagram(pCount, sCount)) result.add(i-p.length+1);
    }

    return result;
  }

  bool _isAnagram(final Map<String, int> pCount, final Map<String, int> sCount) {
    for (final String key in pCount.keys) {
      if (pCount[key] != sCount[key]) {
        return false;
      }
    }
    return true;
  }
}

// class Solution {
//   List<int> findAnagrams(final String s, final String p) {
//     if (p.length > s.length) return [];
//     final List<int> result = [];
//
//     final Map<String, int> pCount = {};
//     final Map<String, int> sCount = {};
//     for (int i = 0; i < p.length; i++) {
//       pCount[p[i]] = (pCount[p[i]] ?? 0) + 1;
//       sCount[s[i]] = (sCount[s[i]] ?? 0) + 1;
//     }
//
//     if (_isAnagram(pCount, sCount)) result.add(0);
//
//     for (int i = p.length; i < s.length; i++) {
//       if (sCount.containsKey(s[i - p.length])) {
//         sCount[s[i - p.length]] = sCount[s[i - p.length]]! - 1;
//       }
//
//       if (pCount.containsKey(s[i])) {
//         sCount[s[i]] = (sCount[s[i]] ?? 0) + 1;
//       }
//
//       if (_isAnagram(pCount, sCount)) result.add(i - p.length + 1);
//     }
//
//     return result;
//   }
//
//   bool _isAnagram(final Map<String, int> pCount,
//       final Map<String, int> sCount) {
//     for (final String key in pCount.keys) {
//       if (pCount[key] != sCount[key]) {
//         return false;
//       }
//     }
//     return true;
//   }
// }

// class Solution {
// List<int> findAnagrams(final String s, final String p) {
//   if (p.length > s.length) return [];
//
//   final List<int> result = [];
//   final Map<String, int> sMap = {}, pMap = {};
//   final int windowSize = p.length;
//
//   for (int i = 0; i < windowSize; i++) {
//     pMap[p[i]] = (pMap[p[i]]?? 0)+1;
//     sMap[s[i]] = (sMap[s[i]]?? 0)+1;
//   }
//   if (_isAnagrams(sMap, pMap)) {
//     result.add(0);
//   }
//
//   for (int i = windowSize; i < s.length; i++) {
//     final String dropKey = s[i-windowSize];
//     if (sMap[dropKey] == 1) {
//       sMap.remove(dropKey);
//     } else {
//       sMap[dropKey] = sMap[dropKey]!-1;
//     }
//
//     sMap[s[i]] = (sMap[s[i]]?? 0)+1;
//
//     if (_isAnagrams(sMap, pMap)) {
//       result.add(i-windowSize+1);
//     }
//   }
//
//   return result;
// }
//
// bool _isAnagrams(final Map<String, int> sMap, final Map<String, int> pMap) {
//   for (String key in pMap.keys) {
//     if (!sMap.containsKey(key) || sMap[key] != pMap[key]) {
//       return false;
//     }
//   }
//   return true;
// }
// }
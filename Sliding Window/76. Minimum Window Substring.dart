
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
    if (t.length == 0 || t.length > s.length) return '';

    String result = '';

    final Map<String, int> tCount = {};
    for (int i = 0; i < t.length; i++) {
      tCount[t[i]] = (tCount[t[i]]?? 0) + 1;
    }

    int have = tCount.length;
    final Map<String, int> sCount = {};
    for (int l = 0, r = 0; r < s.length; r++) {
      if (tCount.containsKey(s[r])) {
        sCount[s[r]] = (sCount[s[r]]?? 0) + 1;
        if (sCount[s[r]]! == tCount[s[r]]!) {
          have--;
        }
      }

      while (have == 0) {
        if (result.length == 0 || result.length > r-l+1) {
          result = s.substring(l, r+1);
        }
        if (sCount.containsKey(s[l])) {
          if (sCount[s[l]] == tCount[s[l]]) {
            have++;
          }
          sCount[s[l]] = sCount[s[l]]! - 1;
        }
        l++;
      }
    }

    return result;
  }
}

/*class Solution {
  String minWindow(final String s, final String t) {
    String result = '';

    if (t.isEmpty) return result;

    final Map<String, int> tMap = {};
    for (int i = 0; i < t.length; i++) {
      tMap[t[i]] = (tMap[t[i]]?? 0) + 1;
    }

    final Map<String, int> sMap = {};
    int minSize = s.length, have = 0;
    for (int l = 0, r = 0; r < s.length; r++) {
      final String char = s[r];
      if (tMap.containsKey(char)) {
        sMap[char] = (sMap[char]?? 0) + 1;
        if (sMap[char] == tMap[char]) {
          have++;
        }
      }

      while (have == tMap.length) {
        if (r-l+1 < minSize) {
          result = s.substring(l, r+1);
          minSize = result.length;
        }

        final String char = s[l];
        if (sMap.containsKey(char)) {
          if (sMap[char] == tMap[char]) {
            have--;
          }
          sMap[char] = sMap[char]!-1;
        }
        l++;
      }

    }

    return result;
  }
}*/

/*class Solution {
  String minWindow(final String s, final String t) {
    String result = '';

    if (t.isEmpty) return result;

    final Map<String, int> tMap = {};
    for (int i = 0; i < t.length; i++) {
      tMap[t[i]] = (tMap[t[i]]?? 0) + 1;
    }

    final Map<String, int> sMap = {};
    int minSize = s.length;
    for (int l = 0, r = 0; r < s.length; r++) {
      final String char = s[r];
      if (tMap.containsKey(char)) {
        sMap[char] = (sMap[char]?? 0) + 1;
      }

      while (_hasSame(sMap, tMap)) {
        if (r-l+1 < minSize) {
          result = s.substring(l, r+1);
          minSize = result.length;
        }

        final String char = s[l];
        if (sMap.containsKey(char)) {
          sMap[char] = sMap[char]!-1;
          if (sMap[char] == 0) {
            sMap.remove(char);
          }
        }
        l++;
      }

    }

    return result;
  }

  bool _hasSame(final Map<String, int> sMap, final Map<String, int> tMap) {
    for (final String key in tMap.keys) {
      if ((sMap[key]?? -1) < tMap[key]!) {
        return false;
      }
    }
    return true;
  }
}*/


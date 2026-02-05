
void main(final List<String> args) {
  print(Solution().wordBreak('leetcode', ['leet','code']));  // true
  print(Solution().wordBreak('applepenapple', ['apple','pen']));  // true
  print(Solution().wordBreak('catsandog', ['cats','dog','sand','and','cat']));  // false

  print(Solution().wordBreak('abcd', ['a','abc','b','cd'])); // true
  print(Solution().wordBreak('catsanddog', ['cats','cat','and','sand','dog'])); // true
  print(Solution().wordBreak('cars', ['car','ca','r','s'])); // true
  print(Solution().wordBreak('aaaaaaa', ['aaaa','aaa'])); // true
  print(Solution().wordBreak('pineapplepenapple', ['apple','pen','applepen','pine','pineapple']));// true
  print(Solution().wordBreak('abcd', ['a', 'bc', 'cd', 'd'])); // true

  print(Solution().wordBreak('leetcode', ['leet', 'codee'])); // false
  print(Solution().wordBreak('applepenapple', ['apple', 'penx'])); // false
  print(Solution().wordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // false
  print(Solution().wordBreak('cars', ['car', 'ca'])); // false
  print(Solution().wordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // false
  print(Solution().wordBreak('leetcode', ['leet', 'codee'])); // false
}

class Solution {
  bool wordBreak(final String s, final List<String> wordDict) {

    final Set<String> set = wordDict.toSet();
    final Map<String, bool> memo = {};

    bool dp(final String s) {
      if (memo.containsKey(s)) return memo[s]!;

      if (s.isEmpty) return false;

      for (int i = 1; i < s.length; i++) {
        final String prefix = s.substring(0, i);
        final String suffix = s.substring(i);

        if (set.contains(prefix) && set.contains(suffix)) {
          memo[s] = true;
          return true;
        }

        if (!set.contains(suffix) && dp(suffix)) {
          memo[s] = true;
          return true;
        }
      }

      memo[s] = false;
      return false;
    }

    return dp(s);
  }
}

/*
class Solution {
  bool wordBreak(final String s, final List<String> wordDict) {
    final Set<String> set = wordDict.toSet();

    final int size = s.length+1;
    final List<bool> dp = List<bool>.filled(size, false);
    dp.first = true;

    for (int endIndex = 1; endIndex < size; endIndex++) {
      for (int startIndex = 0; startIndex < endIndex; startIndex++) {
        if (dp[startIndex] && set.contains(s.substring(startIndex, endIndex))) {
          dp[endIndex] = true;
          break;
        }
      }
    }

    return dp.last;
  }
}
*/

/*
class Solution {
  bool wordBreak(final String s, final List<String> wordDict) {
    final Set<String> set = wordDict.toSet();

    bool dp(final int startIndex) {
      if (startIndex == s.length) {
        return true;
      }

      for (int endIndex = startIndex+1; endIndex < s.length; endIndex++) {
        final String prefix = s.substring(startIndex, endIndex);
        final String suffix = s.substring(endIndex);

        if (set.contains(prefix) && set.contains(suffix)) {
          return true;
        }

        if (!set.contains(suffix) && dp(endIndex)) {
          return true;
        }
      }

      return false;
    }

    return dp(0);
  }
}
*/

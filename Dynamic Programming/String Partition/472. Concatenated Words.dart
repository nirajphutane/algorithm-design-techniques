
void main (final List<String> args) {
  print(Solution().findAllConcatenatedWordsInADict(['cat','cats','catsdogcats','dog','dogcatsdog','hippopotamuses','rat','ratcatdogcat'])); // ['catsdogcats','dogcatsdog','ratcatdogcat']
  print(Solution().findAllConcatenatedWordsInADict(['cat','dog','catdog'])); // ['catdog']

  print(Solution().findAllConcatenatedWordsInADict(['a','aa','aaa','aaaa','aaaaa'])); // ['aa','aaa','aaaa','aaaaa']
  print(Solution().findAllConcatenatedWordsInADict(['blue','green','bluegreen','greenblue','greenbluegreen'])); // ['bluegreen','greenblue','greenbluegreen']
  print(Solution().findAllConcatenatedWordsInADict(['rat','cat','ratcat','catrat','ratcatrat'])); // ['ratcat','catrat','ratcatrat']
  print(Solution().findAllConcatenatedWordsInADict(['one','two','three','onetwo','twothree','onethreetwo'])); // ['onetwo','twothree','onethreetwo']
  print(Solution().findAllConcatenatedWordsInADict(['x','y','z'])); // []
  print(Solution().findAllConcatenatedWordsInADict(['apple','pen','applepen','applepenapple'])); // ['applepen','applepenapple']
}

// class Solution {
//   List<String> findAllConcatenatedWordsInADict(final List<String> words) {
//
//     final List<String> result = [];
//
//     final Set<String> set = words.toSet();
//     final Map<String, bool> memo = {};
//
//     bool dp(final String word) {
//       if (memo.containsKey(word)) return memo[word]!;
//
//       if (word.isEmpty) return false;
//
//       for (int i = 1; i < word.length; i++) {
//         final String prefix = word.substring(0, i);
//         final String suffix = word.substring(i);
//
//         if (set.contains(prefix) && set.contains(suffix)) {
//           memo[word] = true;
//           return true;
//         };
//
//         if (!set.contains(suffix) && dp(suffix)) {
//           memo[word] = true;
//           return true;
//         }
//       }
//
//       memo[word] = false;
//       return false;
//     }
//
//     for (final String word in words) {
//       set.remove(word);
//       if (dp(word)) result.add(word);
//       set.add(word);
//     }
//
//     return result;
//   }
// }

class Solution {
  List<String> findAllConcatenatedWordsInADict(final List<String> words) {
    final Set<String> set = words.toSet();

    final Map<String, bool> memo = {};
    bool dp(final String word) {
      if (memo.containsKey(word)) {
        return memo[word]!;
      }
      for (int i = 1; i < word.length; i++) {
        final String prefix = word.substring(0, i);
        final String suffix = word.substring(i);

        if ((set.contains(prefix) && set.contains(suffix))) {
          memo[word] = true;
          return true;
        }

        if (!set.contains(suffix) && dp(suffix)) {
          memo[word] = true;
          return true;
        }

        // if (set.contains(prefix) && dp(suffix)) {
        //   memo[word] = true;
        //   return true;
        // }
      }

      memo[word] = false;
      return false;
    }

    final List<String> result = [];
    for (final String word in words) {
      if (dp(word)) {
        result.add(word);
      }
    }

    return result;
  }
}
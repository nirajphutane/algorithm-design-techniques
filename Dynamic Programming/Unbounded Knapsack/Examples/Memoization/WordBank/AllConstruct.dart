
void main(final List<String> args) {
  print(Problem().allConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'ef', 'c'])); // [[ab, cd, ef], [ab, c, def], [abc, def], [abcd, ef]]
  print(Problem().allConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd'])); // [[abc, def]]
  print(Problem().allConstruct('enterapotentpot', ['a', 'p', 'ent', 'enter', 'ot', 'o', 't'])); // [[enter, a, p, ot, ent, p, ot], [enter, a, p, o, t, ent, p, ot], [enter, a, p, ot, ent, p, o, t], [enter, a, p, o, t, ent, p, o, t]]
  print(Problem().allConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl'])); // [[purp, le], [p, ur, p, le]]
  print(Problem().allConstruct('', ['cat', 'dog'])); // [[]]
  print(Problem().allConstruct('hello', ['he', 'llo'])); // [[he, llo]]
  print(Problem().allConstruct('skateboard', ['ska', 'te', 'board'])); // [[ska, te, board]]
  print(Problem().allConstruct('abc', ['ab', 'ac'])); // []
  print(Problem().allConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee', 'eeeeee'])); // []
  print(Problem().allConstruct('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // []
  print(Problem().allConstruct('a', [])); // []
  print(Problem().allConstruct('hello', ['hell', 'world'])); // []
}

class Problem {
  List<List<String>> allConstruct(final String target, final List<String> wordBank) => _allConstruct(target, wordBank, {});

  List<List<String>> _allConstruct(final String target, final List<String> wordBank, final Map<String, List<List<String>>> memo) {
    if (memo.containsKey(target)) {
      return memo[target]!;
    }

    if (target.isEmpty) {
      return [[]];
    }

    final List<List<String>> result = [];
    for (final String word in wordBank) {
      if (target.startsWith(word)) {
         for (final List<String> list in _allConstruct(target.substring(word.length), wordBank, memo)) {
           result.add([word, ...list]);
         }
      }
    }

    memo[target] = result;
    return result;
  }
}
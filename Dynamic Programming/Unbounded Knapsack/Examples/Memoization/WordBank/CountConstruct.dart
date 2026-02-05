
void main(final List<String> args) {
  print(Problem().countConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'ef', 'c'])); // 4
  print(Problem().countConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd'])); // 1
  print(Problem().countConstruct('enterapotentpot', ['a', 'p', 'ent', 'enter', 'ot', 'o', 't'])); // 4
  print(Problem().countConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl'])); // 2
  print(Problem().countConstruct('aaaaaaaaaaaaaaaaaaaa', ['a', 'aa', 'aaa', 'aaaa', 'aaaaa'])); // 400096
  print(Problem().countConstruct('', ['cat', 'dog'])); // 1
  print(Problem().countConstruct('hello', ['he', 'llo'])); // 1
  print(Problem().countConstruct('skateboard', ['ska', 'te', 'board'])); // 1
  print(Problem().countConstruct('abc', ['ab', 'ac'])); // 0
  print(Problem().countConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee', 'eeeeee'])); // 0
  print(Problem().countConstruct('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // 0
  print(Problem().countConstruct('a', [])); // 0
  print(Problem().countConstruct('hello', ['hell', 'world'])); // 0
}

class Problem {
  int countConstruct(final String target, final List<String> wordBank) => _countConstruct(target, wordBank, {});

  int _countConstruct(final String target, final List<String> wordBank, final Map<String, int> memo) {
    if (memo.containsKey(target)) {
      return memo[target]!;
    }

    if (target.isEmpty) {
      return 1;
    }

    int totalCount = 0;
    for (final String word in wordBank) {
      if (target.startsWith(word)) {
        totalCount += _countConstruct(target.substring(word.length), wordBank, memo);
      }
    }

    memo[target] = totalCount;
    return totalCount;
  }
}
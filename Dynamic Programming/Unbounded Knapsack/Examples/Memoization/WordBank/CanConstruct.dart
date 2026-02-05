
void main(final List<String> args) {
  print(Problem().canConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'ef', 'c'])); // true
  print(Problem().canConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd'])); // true
  print(Problem().canConstruct('enterapotentpot', ['a', 'p', 'ent', 'enter', 'ot', 'o', 't'])); // true
  print(Problem().canConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl'])); // true
  print(Problem().canConstruct('aaaaaaaaaaaaaaaaaaaa', ['a', 'aa', 'aaa', 'aaaa', 'aaaaa'])); // true
  print(Problem().canConstruct('', ['cat', 'dog'])); // true
  print(Problem().canConstruct('hello', ['he', 'llo'])); // true
  print(Problem().canConstruct('skateboard', ['ska', 'te', 'board'])); // true
  print(Problem().canConstruct('abc', ['ab', 'ac'])); // false
  print(Problem().canConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee', 'eeeeee'],)); // false
  print(Problem().canConstruct('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])); // false
  print(Problem().canConstruct('a', [])); // false
  print(Problem().canConstruct('hello', ['hell', 'world'])); // false
}

class Problem {
  bool canConstruct(final String target, final List<String> wordBank) => _canConstruct(target, wordBank, {});

  bool _canConstruct(final String target, final List<String> wordBank, final Map<String, bool> memo) {
    if (memo.containsKey(target)) {
      return memo[target]!;
    }

    if (target.isEmpty) {
      return true;
    }

    for (final String word in wordBank) {
      if (target.startsWith(word)) {
        if (_canConstruct(target.substring(word.length), wordBank, memo)) {
          memo[target] = true;
          return true;
        }
      }
    }

    memo[target] = false;
    return false;
  }
}
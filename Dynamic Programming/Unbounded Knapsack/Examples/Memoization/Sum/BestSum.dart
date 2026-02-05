
void main(final List<String> args) {
  print(Problem().bestSum(7, [5, 3, 4, 7])); // [7]
  print(Problem().bestSum(8, [2, 3, 5])); // [3, 5]
  print(Problem().bestSum(8, [1, 4, 5])); // [4, 4]
  print(Problem().bestSum(100, [1, 2, 5, 25])); // [25, 25, 25, 25]
}

class Problem {

  List<int>? bestSum(final int target, final List<int> numbers) => _bestSum(target, numbers, {});

  List<int>? _bestSum(final int target, final List<int> numbers, final Map<int, List<int>?> memo) {
    if (memo.containsKey(target)) {
      return memo[target];
    }

    if (target == 0) {
      return [];
    }

    if (target < 0) {
      return null;
    }

    List<int>? result = null;
    for (final int number in numbers) {
      final List<int>? combination = _bestSum(target-number, numbers, memo);
      if (combination != null) {
        if (result == null || result.length > combination.length) {
          result = [...combination, number];
        }
      }
    }

    memo[target] = result;
    return result;
  }
}

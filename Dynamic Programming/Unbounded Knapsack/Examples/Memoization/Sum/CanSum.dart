
void main(final List<String> args) {
  // print(Problem().canSum(7, [2, 3])); // true
  // print(Problem().canSum(7, [5, 3, 4, 7])); // true
  // print(Problem().canSum(8, [2, 3, 5])); // true
  // print(Problem().canSum(999, [2, 3, 7])); // true
  // print(Problem().canSum(500, [7, 13, 29])); // true
  // print(Problem().canSum(1023, [3, 9, 27])); // true
  // print(Problem().canSum(10000, [7, 14, 28, 1])); // true
  // print(Problem().canSum(123456, [37, 41, 73])); // true
  // print(Problem().canSum(1001, [13, 17])); // true
  // print(Problem().canSum(997, [6, 10, 15])); // true
  // print(Problem().canSum(99999, [111, 222, 333])); // false
  // print(Problem().canSum(7, [2, 4])); // false
  // print(Problem().canSum(300, [7, 14])); // false
  // print(Problem().canSum(10000, [7, 14, 28])); // false
}

class Problem {
  bool canSum(final int target, final List<int> numbers) => _canSum(target, numbers, {});

  bool _canSum(final int target, final List<int> numbers, final Map<int, bool> memo) {
    if (memo.containsKey(target)) {
      return memo[target]!;
    }

    if (target == 0) {
      return true;
    }

    if (target < 0) {
      return false;
    }

    for (final int number in numbers) {
      if (_canSum(target-number, numbers, memo)) {
        memo[target] = true;
        return true;
      }
    }

    memo[target] = false;
    return false;
  }
}
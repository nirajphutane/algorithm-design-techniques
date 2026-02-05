
void main(final List<String> args) {
  print(Problem().howSum(7, [2, 3])); // [3, 2, 2]
  print(Problem().howSum(7, [5, 3, 4, 7])); // [7]
  print(Problem().howSum(8, [2, 3, 5])); // [2, 2, 2, 2]
  print(Problem().howSum(7, [2, 4])); // null
  print(Problem().howSum(300, [7, 14])); // null
}

class Problem {

  List<int>? howSum(final int target, final List<int> numbers) => _howSum(target, numbers, {});

  List<int>? _howSum(final int target, final List<int> numbers, final Map<int, List<int>?> memo) {
    if (memo.containsKey(target)) {
      return memo[target];
    }

    if (target == 0) {
      return [];
    }

    if (target < 0) {
      return null;
    }

    for (final int number in numbers) {
      final List<int>? list = _howSum(target-number, numbers, memo);
      if (list != null) {
        memo[target] = [number, ...list];
        return memo[target];
      }
    }

    memo[target] = null;
    return null;
  }
}

// void main(final List<String> args) {
//   print(Problem().howSum(7, [2, 3])); // [[2, 2, 3], [2, 3, 2], [3, 2, 2]]
//   print(Problem().howSum(7, [5, 3, 4, 7])); // [[3, 4], [4, 3], [7]]
//   print(Problem().howSum(8, [2, 3, 5])); // [[2, 2, 2, 2], [2, 3, 3], [3, 2, 3], [3, 3, 2], [3, 5], [5, 3]]
//   print(Problem().howSum(7, [2, 4])); // []
//   print(Problem().howSum(300, [7, 14])); // []
// }
//
// class Problem {
//
//   List<List<int>> howSum(final int target, final List<int> numbers) => _howSum(target, numbers, {});
//
//   List<List<int>> _howSum(final int target, final List<int> numbers, final Map<int, List<List<int>>> memo) {
//     if (memo.containsKey(target)) {
//       return memo[target]!;
//     }
//
//     if (target == 0) {
//       return [[]];
//     }
//
//     if (target < 0) {
//       return [];
//     }
//
//     final List<List<int>> result = [];
//     for (final int number in numbers) {
//       for (final List<int> list in _howSum(target-number, numbers, memo)) {
//         result.add([number, ...list]);
//       }
//     }
//
//     memo[target] = result;
//     return result;
//   }
// }
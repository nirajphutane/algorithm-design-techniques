
void main(final List<String> args) {
  print(Problem().fib(6)); // 8
  print(Problem().fib(7)); // 13
  print(Problem().fib(8)); // 21
  print(Problem().fib(50)); // 12586269025
}

class Problem {

  int fib(final int n) => _fib(n, {});

  int _fib(final int n, final Map<int, int> memo) {

    if (memo.containsKey(n)) {
      return memo[n]!;
    }

    if (n == 0) {
      return 0;
    }

    if (n <= 2) {
      return 1;
    }

    memo[n] = _fib(n-1, memo) + _fib(n-2, memo);
    return memo[n]!;
  }
}
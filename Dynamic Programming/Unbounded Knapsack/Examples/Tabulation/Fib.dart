
void main(final List<String> args) {
  print(Problem().fib(6)); // 8
  print(Problem().fib(7)); // 13
  print(Problem().fib(8)); // 21
  print(Problem().fib(50)); // 12586269025
}

class Problem {

  int fib(final int n) {
    final List<int> table = List.filled(n+1, 0);
    table[1] = 1;
    for (int i = 0; i <= n; i++) {
      if (i <= n-1) {
        table[i+1] += table[i];
      }
      if (i <= n-2) {
        table[i+2] += table[i];
      }
    }
    return table.last;
  }
}
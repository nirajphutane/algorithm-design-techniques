
void main(final List<String> args) {
  print(Problem().gridTraveler(1, 1)); // 1
  print(Problem().gridTraveler(2, 3)); // 3
  print(Problem().gridTraveler(3, 2)); // 3
  print(Problem().gridTraveler(3, 3)); // 6
  print(Problem().gridTraveler(18, 18)); // 2333606220
}

class Problem {

  int gridTraveler(final int rows, final columns) => _gridTraveler(rows, columns, {});

  int _gridTraveler(final int rows, final columns, final Map<String, int> memo) {
    if (memo.containsKey('$rows:$columns')) {
      return memo['$rows:$columns']!;
    }

    if (rows == 0 || columns == 0) {
      return 0;
    }

    if (rows == 1 && columns == 1) {
      return 1;
    }
    
    memo['$rows:$columns'] = _gridTraveler(rows-1, columns, memo) + _gridTraveler(rows, columns-1, memo);
    return memo['$rows:$columns']!;
  }
}
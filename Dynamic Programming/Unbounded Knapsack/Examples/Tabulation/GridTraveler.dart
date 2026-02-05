
void main(final List<String> args) {
  print(Problem().gridTraveler(1, 1)); // 1
  print(Problem().gridTraveler(2, 3)); // 3
  print(Problem().gridTraveler(3, 2)); // 3
  print(Problem().gridTraveler(3, 3)); // 6
  print(Problem().gridTraveler(18, 18)); // 2333606220
}

class Problem {

  int gridTraveler(final int rows, final columns) {

    if (rows == 1 || columns == 1) return 1;

    final List<List<int>> table = List<List<int>>.generate(rows+1, (_) => List<int>.filled(columns+1, 0));
    table[1][1] = 1;

    for (int row = 0; row <= rows; row++) {
      for (int column = 0; column <= columns; column++) {
        if (row+1 <= rows) {
          table[row+1][column] += table[row][column];
        }
        if (column+1 <= columns) {
          table[row][column+1] += table[row][column];
        }
      }
    }

    return table[rows][columns];
  }
}
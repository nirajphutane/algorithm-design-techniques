
import 'dart:math';

void main(final List<String> args) {
  print(Solution().isHappy(19));  // true
  print(Solution().isHappy(2));  // false
}

class Solution {

  bool isHappy(final int n) {
    int slow = _getSquare(n);
    int fast = _getSquare(_getSquare(n));

    while (slow != fast && fast != 1) {
      slow = _getSquare(slow);
      fast = _getSquare(_getSquare(fast));
    }

    return fast == 1? true: false;
  }

  int _getSquare(int n) {
   int sum = 0;
   while (n > 0) {
     sum += pow(n%10, 2).toInt();
     n ~/= 10;
   }
   return sum;
  }
}
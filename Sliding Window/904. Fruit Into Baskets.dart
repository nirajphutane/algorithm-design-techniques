
import 'dart:math';

void main(final List<String> args) {
  print(Solution().totalFruit([1,2,1])); // 3
  print(Solution().totalFruit([0,1,2,2])); // 3
  print(Solution().totalFruit([1,2,3,2,2])); // 4

  print(Solution().totalFruit([1,2,3]));  // 2
  print(Solution().totalFruit([3,3,3,1,2,1,2]));  // 4
  print(Solution().totalFruit([0,1,2,3,2,2]));  // 4
  print(Solution().totalFruit([4,1,1,1,3,3,3,4]));  // 6
}

class Solution {
  int totalFruit(final List<int> fruits) {

    int totalFruits = 0;
    final Map<int, int> treeCount = {};
    for (int l = 0, r = 0; r < fruits.length; r++) {
      treeCount[fruits[r]] = (treeCount[fruits[r]]?? 0) +1;

      while (treeCount.length > 2) {
        treeCount[fruits[l]] = treeCount[fruits[l]]! -1;
        if (treeCount[fruits[l]] == 0) {
          treeCount.remove(fruits[l]);
        }
        l++;
      }

      totalFruits = max(totalFruits, r-l+1);
    }

    return totalFruits;
  }
}

// class Solution {
//   int totalFruit(final List<int> fruits) {
//     int result = 0, total = 0;
//
//     final Map<int, int> frequencies = {};
//     for (int l = 0, r = 0; r < fruits.length; r++) {
//       final int fruit = fruits[r];
//       frequencies[fruit] = (frequencies[fruit]?? 0)+1;
//       total++;
//       while (frequencies.length > 2) {
//         final int fruit = fruits[l++];
//         frequencies[fruit] = frequencies[fruit]! -1;
//         total--;
//         if (frequencies[fruit] == 0) frequencies.remove(fruit);
//       }
//       result = max(result, total);
//     }
//
//     return result;
//   }
// }
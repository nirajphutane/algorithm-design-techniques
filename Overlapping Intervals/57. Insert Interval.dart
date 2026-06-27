
import 'dart:math';

void main(final List<String> args) {
  print(Solution().insert([[1,3],[6,9]], [2,5])); // [[1,5],[6,9]]
  print(Solution().insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])); // [[1,2],[3,10],[12,16]]

  print(Solution().insert([[1,5]], [2,3]));               // [[1,5]]
  print(Solution().insert([[1,5]], [6,8]));               // [[1,5],[6,8]]
  print(Solution().insert([[3,5]], [1,2]));               // [[1,2],[3,5]]
  print(Solution().insert([[1,2],[5,6]], [3,4]));         // [[1,2],[3,4],[5,6]]
  print(Solution().insert([[1,2],[5,6]], [2,5]));         // [[1,6]]
  print(Solution().insert([[1,10]], [2,9]));              // [[1,10]]
  print(Solution().insert([[2,3],[4,5],[6,7]], [1,10]));  // [[1,10]]
  print(Solution().insert([[1,2],[3,4],[7,8]], [5,6]));   // [[1,2],[3,4],[5,6],[7,8]]
  print(Solution().insert([[1,2],[3,4],[7,8]], [4,7]));   // [[1,2],[3,8]]
  print(Solution().insert([], [4,8]));                    // [[4,8]]
  print(Solution().insert([[1,5]], [5,7]));               // [[1,7]]
}

class Solution {
  List<List<int>> insert(final List<List<int>> intervals, final List<int> newInterval) {
    final List<List<int>> result = [];

    int i = 0;

    while(i < intervals.length && newInterval.first > intervals[i].last) {
      result.add(intervals[i]);
      i++;
    }

    while (i < intervals.length && intervals[i].first <= newInterval.last) {
      newInterval.first = min(newInterval.first, intervals[i].first);
      newInterval.last = max(newInterval.last, intervals[i].last);
      i++;
    }
    result.add(newInterval);

    while(i < intervals.length) {
      result.add(intervals[i]);
      i++;
    }

    return result;
  }
}

// class Solution {
//   List<List<int>> insert(final List<List<int>> intervals, final List<int> newInterval) {
//     final List<List<int>> result = [];
//
//     for (int i = 0; i < intervals.length; i++) {
//       if (newInterval.last < intervals[i].first) {
//         return [...result, newInterval, ...intervals.sublist(i)];
//       } else if(newInterval.first > intervals[i].last) {
//         result.add(intervals[i]);
//       } else {
//         newInterval.first = min(newInterval.first, intervals[i].first);
//         newInterval.last = max(newInterval.last, intervals[i].last);
//       }
//     }
//     result.add(newInterval);
//
//     return result;
//   }
// }
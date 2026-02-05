
import 'dart:math';

void main(final List<String> args) {
  print(Solution().insert([[1,3],[6,9]], [2,5])); // [[1,5],[6,9]]
  print(Solution().insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])); // [[1,2],[3,10],[12,16]]
}

class Solution {
  List<List<int>> insert(final List<List<int>> intervals, final List<int> newInterval) {
    final List<List<int>> result = [];

    int i = 0;

    while(newInterval.first > intervals[i].last) {
      result.add(intervals[i]);
      i++;
    }

    while (intervals[i].first <= newInterval.last) {
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

  // List<List<int>> insert(final List<List<int>> intervals, final List<int> newInterval) {
  //   final List<List<int>> result = [];
  //
  //   for (int i = 0; i < intervals.length; i++) {
  //     if (newInterval.last < intervals[i].first) {
  //       return [...result, newInterval, ...intervals.sublist(i)];
  //     } else if(newInterval.first > intervals[i].last) {
  //       result.add(intervals[i]);
  //     } else {
  //       newInterval.first = min(newInterval.first, intervals[i].first);
  //       newInterval.last = max(newInterval.last, intervals[i].last);
  //     }
  //   }
  //   result.add(newInterval);
  //
  //   return result;
  // }
}
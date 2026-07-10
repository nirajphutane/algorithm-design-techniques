
void main(final List<String> args) {
  print(Solution().eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])); // 1
  print(Solution().eraseOverlapIntervals([[1,2],[1,2],[1,2]])); // 2
  print(Solution().eraseOverlapIntervals([[1,2],[2,3]])); // 0

  print(Solution().eraseOverlapIntervals([[1,2],[3,4],[5,6]]));             // 0
  print(Solution().eraseOverlapIntervals([[1,2],[2,3],[3,4],[4,5]]));       // 0
  print(Solution().eraseOverlapIntervals([[1,3],[3,3],[3,5]]));             // 0
  print(Solution().eraseOverlapIntervals([[1,2]]));                         // 0
  print(Solution().eraseOverlapIntervals([[1,3],[2,4],[3,5]]));             // 1
  print(Solution().eraseOverlapIntervals([[1,5],[2,3],[3,4]]));             // 1
  print(Solution().eraseOverlapIntervals([[1,4],[2,3],[3,4],[1,3]]));       // 2
  print(Solution().eraseOverlapIntervals([[0,2],[1,3],[2,4],[3,5]]));       // 2
  print(Solution().eraseOverlapIntervals([[1,2],[1,3],[1,4]]));             // 2
  print(Solution().eraseOverlapIntervals([[1,100],[11,22],[1,11],[2,12]])); // 2
  print(Solution().eraseOverlapIntervals([[1,10],[2,9],[3,8],[4,7]]));      // 3
}

class Solution {
  int eraseOverlapIntervals(final List<List<int>> intervals) {
    intervals.sort((a, b) => a.last - b.last);

    int count = 0;
    List<int> interval = intervals.first;
    for (int i = 1; i < intervals.length; i++) {
      if (intervals[i].first < interval.last) {
        count++;
        continue;
      }
      interval = intervals[i];
    }

    return count;
  }
}

// class Solution {
//   int eraseOverlapIntervals(final List<List<int>> intervals) {
//     intervals.sort((a, b) => a.last.compareTo(b.last));
//
//     int count = 0;
//     int previousLast = intervals.first.last;
//     for (int i = 1; i < intervals.length; i++) {
//       final List<int> current = intervals[i];
//       if (current.first < previousLast) {
//         count++;
//       } else {
//         previousLast = current.last;
//       }
//     }
//     return count;
//   }
// }
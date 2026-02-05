
void main(final List<String> args) {
  print(Solution().eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])); // 1
  print(Solution().eraseOverlapIntervals([[1,2],[1,2],[1,2]])); // 2
  print(Solution().eraseOverlapIntervals([[1,2],[2,3]])); // 0
  print(Solution().eraseOverlapIntervals([[1,100],[11,22],[1,11],[2,12]])); // 2
}

class Solution {
  int eraseOverlapIntervals(final List<List<int>> intervals) {
    intervals.sort((a, b) => a.last.compareTo(b.last));

    int count = 0;
    int previousLast = intervals.first.last;
    for (int i = 1; i < intervals.length; i++) {
      final List<int> current = intervals[i];
      if (current.first < previousLast) {
        count++;
      } else {
        previousLast = current.last;
      }
    }
    return count;
  }

  // int eraseOverlapIntervals(final List<List<int>> intervals) {
  //   intervals.sort((a, b) => a.last.compareTo(b.last));
  //
  //   int count = 0;
  //   List<int> previous = intervals.first;
  //   for (int i = 1; i < intervals.length; i++) {
  //     if (previous.last <= intervals[i].first) {
  //       previous = intervals[i];
  //     } else {
  //       count++;
  //     }
  //   }
  //   return count;
  // }
}

void main(final List<String> args) {
  print(Solution().merge([[1,3],[2,6],[8,10],[15,18]])); // [[1,6],[8,10],[15,18]]
  print(Solution().merge([[1,4],[4,5]])); // [[1,5]]
  print(Solution().merge([[4,7],[1,4]])); // [[1,7]]
  print(Solution().merge([[1,10],[2,3],[4,8]]));  // [[1, 10]]
}

class Solution {
  List<List<int>> merge(final List<List<int>> intervals) {
    final List<List<int>> result = [];

    intervals.sort((a,b) => a.first.compareTo(b.first));
    List<int> previous = intervals.first;
    for (int i = 1; i < intervals.length; i++) {
      final List<int> current = intervals[i];
      if (current.first <= previous.last) {   // if (interval.first <= intervals[i].first && intervals[i].first <= interval.last) {
        if (previous.last < current.last) {
          previous.last = current.last;
        }
      } else {
        result.add(previous);
        previous = current;
      }
    }
    result.add(previous);

    return result;
  }
}

void main(final List<String> args) {
  print(Solution().merge([[1,3],[2,6],[8,10],[15,18]])); // [[1,6],[8,10],[15,18]]
  print(Solution().merge([[1,4],[4,5]])); // [[1,5]]
  print(Solution().merge([[4,7],[1,4]])); // [[1,7]]
  print(Solution().merge([[1,10],[2,3],[4,8]]));  // [[1, 10]]

  print(Solution().merge([[1,2],[3,4],[5,6]]));                // [[1,2],[3,4],[5,6]]
  print(Solution().merge([[1,5],[2,3],[6,8]]));                // [[1,5],[6,8]]
  print(Solution().merge([[1,3],[4,6],[5,7]]));                // [[1,3],[4,7]]
  print(Solution().merge([[1,3],[1,3],[1,3]]));                // [[1,3]]
  print(Solution().merge([[1,4],[2,5],[7,9],[8,10]]));         // [[1,5],[7,10]]
  print(Solution().merge([[5,6],[1,2],[3,4]]));                // [[1,2],[3,4],[5,6]]
  print(Solution().merge([[5,10],[1,4],[6,8]]));               // [[1,4],[5,10]]
  print(Solution().merge([[0,0],[1,4],[4,4]]));                // [[0,0],[1,4]]
  print(Solution().merge([[-10,-1],[-5,0],[1,3]]));            // [[-10,0],[1,3]]
  print(Solution().merge([[1,2]]));                            // [[1,2]]
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
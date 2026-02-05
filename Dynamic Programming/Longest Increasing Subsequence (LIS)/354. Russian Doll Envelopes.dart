
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxEnvelopes([[5,4],[6,4],[6,7],[2,3]])); // 3
  print(Solution().maxEnvelopes([[1,1],[1,1],[1,1]])); // 1

  print(Solution().maxEnvelopes([[2,3],[2,4],[2,5]]));  // 1
  print(Solution().maxEnvelopes([[1,3],[2,3],[3,3]]));  // 1
  print(Solution().maxEnvelopes([[3,3],[3,2],[3,4]]));  // 1
  print(Solution().maxEnvelopes([[10,10]]));  // 1
  print(Solution().maxEnvelopes([[3,4],[4,3]]));  // 1
  print(Solution().maxEnvelopes([[1,2],[2,1]]));  // 1
  print(Solution().maxEnvelopes([[1,1],[2,2]]));  // 2
  print(Solution().maxEnvelopes([[5,5],[4,4],[3,3]]));  // 3
  print(Solution().maxEnvelopes([[5,4],[6,4],[6,7],[2,3]]));  // 3
  print(Solution().maxEnvelopes([[4,5],[4,6],[6,7],[6,4],[2,3]]));  // 3
  print(Solution().maxEnvelopes([[1,2],[2,3],[3,1],[4,4]]));  // 3
  print(Solution().maxEnvelopes([[4,5],[4,6],[6,7],[2,3],[1,1]])); // 4
  print(Solution().maxEnvelopes([[1,1],[2,2],[3,3],[4,4],[5,5]])); // 5
  print(Solution().maxEnvelopes([[8,9],[1,1],[7,8],[2,2],[6,7],[3,3]])); // 6
}

class Solution {

  int maxEnvelopes(final List<List<int>> envelopes) {
    int lis = 1;

    envelopes.sort((a, b) => (a.first == b.first)? b.last.compareTo(a.last): a.first.compareTo(b.first));

    final List<int> dp = List<int>.filled(envelopes.length, 1);
    for (int current = 0; current < envelopes.length; current++) {
      for (int previous = 0; previous < current; previous++) {
        if ((envelopes[previous].first < envelopes[current].first) && (envelopes[previous].last < envelopes[current].last)) {
          dp[current] = max(dp[current], dp[previous] + 1);
          lis = max(lis, dp[current]);
        }
      }
    }

    return lis;
  }
}

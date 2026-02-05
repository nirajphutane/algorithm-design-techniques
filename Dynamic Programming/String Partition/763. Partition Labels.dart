
import 'dart:math';

void main(final List<String> args) {
  print(Solution().partitionLabels('ababcbacadefegdehijhklij'));  // [9,7,8]
  print(Solution().partitionLabels('eccbbbbdec'));  // [10]

  print(Solution().partitionLabels('a'));  // [1]
  print(Solution().partitionLabels('aaaaa'));  // [5]
  print(Solution().partitionLabels('abcdef'));  // [1,1,1,1,1,1]
  print(Solution().partitionLabels('abac'));  // [3,1]
  print(Solution().partitionLabels('abacbdc'));  // [7]
  print(Solution().partitionLabels('xyzxyz'));  // [6]
  print(Solution().partitionLabels('abccdefghhijkllmnnoopp'));  // [1,1,2,1,1,1,1,2,1,1,1,2,1,2,2,2]
  print(Solution().partitionLabels(''));  // []
}

class Solution {
  List<int> partitionLabels(final String s) {
    final List<int> result = [];

    final Map<String, int> map = {};
    for (int i = 0; i < s.length; i++) map[s[i]] = i;

    int size = 0;
    for (int end = 0, start = 0; start < s.length; start++) {
      size++;
      end = max(end, map[s[start]]!);
      if (start == end) {
        result.add(size);
        size = 0;
      }
    }

    return result;
  }
}

// class Solution {
//   List<int> partitionLabels(final String s) {
//     final List<int> result = [];
//
//     final Map<String, int> map = {};
//     for (int i = 0; i < s.length; i++) {
//       map[s[i]] = i;
//     }
//
//     int size = 0, end = 0;
//     for (int i = 0; i < s.length; i++) {
//       size++;
//       end = max(end, map[s[i]]!);
//       if (i == end) {
//         result.add(size);
//         size = 0;
//       }
//     }
//
//     return result;
//   }
// }
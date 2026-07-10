import 'package:collection/collection.dart';

void main(final List<String> args) {
  print(Solution().minMeetingRooms([[15,20],[0,30],[5,10]])); // 2
  print(Solution().minMeetingRooms([[4,5],[1,4]])); // 1
  print(Solution().minMeetingRooms([[8,10],[1,3],[15,18],[2,6]])); // 2

  print(Solution().minMeetingRooms([[7,10],[2,4]])); // 1
  print(Solution().minMeetingRooms([[1,2]])); // 1
  print(Solution().minMeetingRooms([[1,10],[2,3],[4,5],[6,7],[8,9]])); // 2
  print(Solution().minMeetingRooms([[1,3],[2,4],[3,5],[4,6]])); // 2
  print(Solution().minMeetingRooms([[1,2],[3,100],[4,5]])); // 2
  print(Solution().minMeetingRooms([[1,2],[1,2],[10,11],[10,11]])); // 2
  print(Solution().minMeetingRooms([[1,5],[2,6],[4,8],[9,10]])); // 3
  print(Solution().minMeetingRooms([[1,2],[1,2],[1,2],[10,11]])); // 3
}

class Solution {
  int minMeetingRooms(final List<List<int>> intervals) {

    intervals.sort((a, b) => a.first - b.first);

    final HeapPriorityQueue<int> priorityQueue = HeapPriorityQueue();
    priorityQueue.add(intervals.first.last);

    for (int i = 1; i < intervals.length; i++) {
      if (priorityQueue.first <= intervals[i].first) {
        priorityQueue.removeFirst();
      }
      priorityQueue.add(intervals[i].last);
    }

    return priorityQueue.length;
  }
}

// class Solution {
//   int minMeetingRooms(final List<List<int>> intervals) {
//
//     intervals.sort((a, b) => a.first - b.first);
//     // print(intervals);
//
//     bool r = false;
//     final List<int> rooms = [intervals.first.last];
//     for (int i = 1; i < intervals.length; i++) {
//       r = true;
//       for (int j = 0; j < rooms.length; j++) {
//         if(rooms[j] <= intervals[i].first && rooms[j] <= intervals[i].last) {
//           r = false;
//           rooms[j] = intervals[i].last;
//           break;
//         }
//       }
//       if (r) rooms.add(intervals[i].last);
//     }
//
//     // print(rooms);
//     return rooms.length;
//   }
// }
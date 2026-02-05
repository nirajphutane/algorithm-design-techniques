
void main(final List<String> args) {
  print(Solution().circularArrayLoop([2,-1,1,2,2])); // true
  print(Solution().circularArrayLoop([4,-1,4,-2,4])); // false
  print(Solution().circularArrayLoop([1,-1,5,1,4])); // true

  print(Solution().circularArrayLoop([1, 1, 1, 1]));  // true
  print(Solution().circularArrayLoop([-1, -1, -1]));  // true
  print(Solution().circularArrayLoop([3, 1, 2])); // true
  print(Solution().circularArrayLoop([2, 2, 2]));	// true
  print(Solution().circularArrayLoop([-2, -1, -1]));  // true
  print(Solution().circularArrayLoop([1, 2, 1, 2])); // true

  print(Solution().circularArrayLoop([1])); // false
  print(Solution().circularArrayLoop([-1]));  // false
  print(Solution().circularArrayLoop([2, 2]));  // false
  print(Solution().circularArrayLoop([-2, -2]));  // false
  print(Solution().circularArrayLoop([1, 1, -1, 1]));	// false
  print(Solution().circularArrayLoop([1, -1]));	// false
  print(Solution().circularArrayLoop([2, -1, 2]));  // false
  print(Solution().circularArrayLoop([1, 2, 3, -6]));	// false
  print(Solution().circularArrayLoop([-1, -2, -3, 6]));	// false
  print(Solution().circularArrayLoop([2, 1, -1, 2]));	// false
  print(Solution().circularArrayLoop([1, -1, 2, 2]));	// false
}

class Solution {
  bool circularArrayLoop(final List<int> nums) {

    int _pointer(final int current) {
      final int next = (current + nums[current]) % nums.length;
      if ((current == next) || ((nums[current] < 0 && nums[next] > 0) || nums[current] > 0 && nums[next] < 0)) {
        return -1;
      }
      return next;
    }

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) continue;

      int slow = i, fast = i;
      while (true) {
        slow = _pointer(slow);
        fast = _pointer(fast);
        if (slow == -1 || fast == -1) {
          break;
        }

        fast = _pointer(fast);
        if (fast == -1) {
          break;
        }

        if (slow == fast) {
          return true;
        }
      }

      int s = i;
      while (nums[s] != 0) {
        final int n = _pointer(s);
        if (n == -1) {
          break;
        }
        nums[s] = 0;
        s = n;
      }
    }

    return false;
  }
}

// class Solution {
//   bool circularArrayLoop(final List<int> nums) {
//
//     int _pointer(final int current) {
//       final int next = (current + nums[current]) % nums.length;
//       if ((current == next) || ((nums[current] < 0 && nums[next] > 0) || nums[current] > 0 && nums[next] < 0)) {
//         return -1;
//       }
//       return next;
//     }
//
//     final Set<int> set = {};
//
//     for (int i = 0; i < nums.length; i++) {
//       if (set.contains(i)) continue;
//
//       int slow = i, fast = i;
//       while (true) {
//         slow = _pointer(slow);
//         fast = _pointer(fast);
//         if (slow == -1 || fast == -1) {
//           break;
//         }
//
//         fast = _pointer(fast);
//         if (fast == -1) {
//           break;
//         }
//
//         set.add(slow);
//         set.add(fast);
//
//         if (slow == fast) {
//           return true;
//         }
//       }
//     }
//
//     return false;
//   }
// }

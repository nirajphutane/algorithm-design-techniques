
void main(final List<String> args) {
  print(Solution().threeSum([-1,0,1,2,-1,-4]));  // [[-1,-1,2],[-1,0,1]]
  print(Solution().threeSum([0,1,1]));  // []
  print(Solution().threeSum([0,0,0]));  // [[0,0,0]]

  print(Solution().threeSum([-1, -1, 0, 1])); // [[-1,0,1]]
  print(Solution().threeSum([-2, -1, -1, 3]));  // [[-2,-1,3]]
  print(Solution().threeSum([-3, 1, 2, 2]));  // [[-3,1,2]]
  print(Solution().threeSum([-1, -1, -1, 0, 1, 1, 2, 2]));  // [[-1,-1,2], [-1,0,1]]
  print(Solution().threeSum([0,0,0,0]));  // [[0,0,0]]
}

class Solution {

  List<List<int>> threeSum(final List<int> nums) {
    nums.sort();
    final List<List<int>> result = [];
    final Set<Triple> set = {};
    for (int i = 0; i < nums.length-2; i++) {
      if (nums[i] > 0) break;

      int j = i+1, k = nums.length-1;
      while (j < k) {
        final int sum = nums[i] + nums[j] + nums[k];
        if (sum > 0) {
          k--;
        } else if (sum < 0) {
          j++;
        } else {
          final Triple triple = Triple(nums[i], nums[j], nums[k]);
          if (!set.contains(triple)) {
            set.add(triple);
            result.add(triple.toList());
          }
          j++; k--;
        }
      }
    }

    return result;
  }
}

class Triple {
  final int first, second, third;
  const Triple(this.first, this.second, this.third);

  @override
  operator ==(final Object object) => object is Triple && first == object.first && second == object.second && third == object.third;

  @override
  int get hashCode => Object.hash(first, second, third);

  toList() => [first, second, third];
}

// class Solution {
//
//   List<List<int>> threeSum(final List<int> nums) {
//     final List<List<int>> result = [];
//     nums.sort();
//
//     final Set<Triple> set = {};
//     int i = 0;
//     while (i < nums.length && nums[i] <= 0) {
//       if (i > 0 && nums[i-1] == nums[i]) {
//         i++;
//         continue;
//       }
//       int l = i+1, r = nums.length-1;
//       while (l < r) {
//         final int sum = nums[i] + nums[l] + nums[r];
//         if (sum == 0) {
//           final List<int> list = [nums[i], nums[l], nums[r]];
//           list.sort();
//           if (!set.contains(Triple(list[0], list[1], list[2]))) {
//             result.add(list);
//           }
//           set.add(Triple(list[0], list[1], list[2]));
//           l++;
//           while (l < r && nums[l] == nums[l+1]){ l++; }
//           r--;
//           while (l < r && nums[r] == nums[r-1]){ r--; }
//           continue;
//         }
//
//         if (sum > 0) {
//           r--;
//         } else {
//           l++;
//         }
//       }
//       i++;
//     }
//
//     return result.toList();
//   }
// }
//
// class Triple {
//   final int a, b, c;
//   const Triple(this.a, this.b, this.c);
//
//   @override
//   bool operator ==(Object other) => other is Triple && a == other.a && b == other.b && c == other.c;
//
//   @override
//   int get hashCode => Object.hash(a, b, c);
// }
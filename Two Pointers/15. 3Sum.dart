
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
    final List<List<int>> result = [];
    nums.sort();

    final Set<Triple> set = {};
    int i = 0;
    while (i < nums.length && nums[i] <= 0) {
      if (i > 0 && nums[i-1] == nums[i]) {
        i++;
        continue;
      }
      int l = i+1, r = nums.length-1;
      while (l < r) {
        final int sum = nums[i] + nums[l] + nums[r];
        if (sum == 0) {
          final List<int> list = [nums[i], nums[l], nums[r]];
          list.sort();
          if (!set.contains(Triple(list[0], list[1], list[2]))) {
            result.add(list);
          }
          set.add(Triple(list[0], list[1], list[2]));
          l++;
          while (l < r && nums[l] == nums[l+1]){ l++; }
          r--;
          while (l < r && nums[r] == nums[r-1]){ r--; }
          continue;
        }

        if (sum > 0) {
          r--;
        } else {
          l++;
        }
      }
      i++;
    }

    return result.toList();
  }
}

class Triple {
  final int a, b, c;
  const Triple(this.a, this.b, this.c);

  @override
  bool operator ==(Object other) => other is Triple && a == other.a && b == other.b && c == other.c;

  @override
  int get hashCode => Object.hash(a, b, c);
}
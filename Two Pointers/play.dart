

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
      int j = i+1, k = nums.length-1;
      while (j < k) {
        final int sum = nums[i] + nums[j] + nums[k];
        if (sum == 0) {
          final Triple triple = Triple(nums[i], nums[j], nums[k]);
          if (!set.contains(triple)) {
            set.add(triple);
            result.add(triple.toList());
          }
        }
        if (sum < 0) {
          j++;
        } else {
          k--;
        }
      }
    }

    return result;
  }
}

class Triple {
  final int a, b, c;
  const Triple(this.a, this.b, this.c);

  @override
  bool operator ==(final Object object) {
    if (object is Triple) {
      return (object.a == a && object.b == b && object.c == c);
    } else {
      return false;
    }
  }

  List<int> toList() => [a, b, c];

  @override
  int get hashCode => Object.hash(a, b, c);
}
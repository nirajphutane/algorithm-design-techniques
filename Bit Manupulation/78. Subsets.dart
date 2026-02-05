
void main(final List<String> args) {
  print(Solution().subsets([1,2,3])); // [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
  print(Solution().subsets([0])); // [[],[0]]
}

class Solution {
  List<List<int>> subsets(final List<int> nums) {
    final List<List<int>> result = List<List<int>>.generate(1 << nums.length, (_) => []);

    for (int i = 0; i < result.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i & (1 << j) != 0) {
          result[i].add(nums[j]);
        }
      }
    }

    return result;
  }
}

void main(final List<String> args) {
  print(Solution().pathSum(TreeNode(10, TreeNode(5, TreeNode(3, TreeNode(3), TreeNode(-2)), TreeNode(2, null, TreeNode(1))), TreeNode(-3, null, TreeNode(11))), 8)); // 3
  print(Solution().pathSum(TreeNode(-2, null, TreeNode(-3)), -5)); // 1

  print(Solution().pathSum(null, 0)); // 0
  print(Solution().pathSum(TreeNode(1), 2)); // 0
  print(Solution().pathSum(TreeNode(1, TreeNode(1), TreeNode(1)), 3)); // 0
  print(Solution().pathSum(TreeNode(1), 1)); // 1
  print(Solution().pathSum(TreeNode(0), 0)); // 1
  print(Solution().pathSum(TreeNode(-1), -1)); // 1
  print(Solution().pathSum(TreeNode(-1, TreeNode(-2, TreeNode(-3))), -6)); // 1
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4)))), 6)); // 1
  print(Solution().pathSum(TreeNode(1, null, TreeNode(2, null, TreeNode(3, null, TreeNode(4)))), 6)); // 1
  print(Solution().pathSum(TreeNode(1, TreeNode(1), TreeNode(1)), 2)); // 2
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 3)); // 2
  print(Solution().pathSum(TreeNode(1, null, TreeNode(2, null, TreeNode(3))), 3)); // 2
  print(Solution().pathSum(TreeNode(-1, TreeNode(-2), TreeNode(-3)), -3)); // 2
  print(Solution().pathSum(TreeNode(1, TreeNode(1), TreeNode(1)), 1)); // 3
  print(Solution().pathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1)))), 22)); // 3
  print(Solution().pathSum(TreeNode(0, TreeNode(0), TreeNode(0)), 0)); // 5
  print(Solution().pathSum(TreeNode(1, TreeNode(-1, TreeNode(1), TreeNode(0)), TreeNode(1, TreeNode(-1), TreeNode(1))), 1)); // 6
  print(Solution().pathSum(TreeNode(0, TreeNode(0, TreeNode(0), TreeNode(0)), TreeNode(0)), 0)); // 11
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int pathSum(final TreeNode? root, final int targetSum) {

    int dfs(final TreeNode? node, final Map<int, int> frequency, int prefixSum) {
      if (node == null) return 0;

      prefixSum += node.val;

      int count = frequency[prefixSum - targetSum]?? 0;

      frequency[prefixSum] = (frequency[prefixSum]?? 0) + 1;

      count += dfs(node.left, frequency, prefixSum);
      count += dfs(node.right, frequency, prefixSum);

      frequency[prefixSum] = frequency[prefixSum]! - 1;

      return count;
    }

    return dfs(root, {0 : 1}, 0);
  }
}

// class Solution {
//
//   int pathSum(final TreeNode? root, final int targetSum) {
//
//     final Map<int, int> frequency = {0 : 1};
//
//     int dfs(final TreeNode? node, int prefixSum) {
//       if (node == null) return 0;
//
//       prefixSum += node.val;
//
//       int count = frequency[prefixSum - targetSum]?? 0;
//
//       frequency[prefixSum] = (frequency[prefixSum]?? 0) + 1;
//
//       count += dfs(node.left, prefixSum);
//       count += dfs(node.right, prefixSum);
//
//       frequency[prefixSum] = frequency[prefixSum]! - 1;
//
//       return count;
//     }
//
//     return dfs(root, 0);
//   }
// }
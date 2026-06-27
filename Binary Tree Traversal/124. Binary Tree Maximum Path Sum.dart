
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxPathSum(TreeNode(1, TreeNode(2), TreeNode(3)))); // 6
  print(Solution().maxPathSum(TreeNode(-10, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // 42

  print(Solution().maxPathSum(TreeNode(5))); // 5
  print(Solution().maxPathSum(TreeNode(-3))); // -3
  print(Solution().maxPathSum(TreeNode(2, TreeNode(-1), null))); // 2
  print(Solution().maxPathSum(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3)))); // 11
  print(Solution().maxPathSum(TreeNode(1, TreeNode(-2), TreeNode(3)))); // 4
  print(Solution().maxPathSum(TreeNode(-3, TreeNode(-2), TreeNode(-1)))); // -1
  print(Solution().maxPathSum(TreeNode(10, TreeNode(2, TreeNode(20), TreeNode(1)), TreeNode(10, null, TreeNode(-25, TreeNode(3), TreeNode(4)))))); // 42
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxPathSum(final TreeNode? root) {

    int maxSum = root?.val?? 0;

    int dfs(final TreeNode? node) {
      if (node == null) return 0;

      final left = max(dfs(node.left), 0);
      final right = max(dfs(node.right), 0);

      maxSum = max(maxSum, (left + node.val + right));  // Diameter

      return max(left, right) + node.val;   // Height
    }

    dfs(root);
    return maxSum;
  }
}
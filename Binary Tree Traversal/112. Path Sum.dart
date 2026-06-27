
void main() {
  print(Solution().hasPathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, null, TreeNode(1)))), 22)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 5)); // false
  print(Solution().hasPathSum(null, 0)); // false

  print(Solution().hasPathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, null, TreeNode(1)))), 22)); // true
  print(Solution().hasPathSum(TreeNode(1), 1)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 6)); // true
  print(Solution().hasPathSum(TreeNode(1, null, TreeNode(2, null, TreeNode(3))), 6)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3)), 7)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3)), 8)); // true
  print(Solution().hasPathSum(TreeNode(-2, null, TreeNode(-3)), -5)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(-2, TreeNode(1, TreeNode(-1)), TreeNode(3)), TreeNode(-3, TreeNode(-2))), -1)); // true
  print(Solution().hasPathSum(TreeNode(0), 0)); // true
  print(Solution().hasPathSum(TreeNode(0, TreeNode(0), TreeNode(0)), 0)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(1, TreeNode(1), TreeNode(1)), TreeNode(1)), 3)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 4)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 3)); // true
  print(Solution().hasPathSum(TreeNode(1, TreeNode(-2, TreeNode(1, TreeNode(-1)), TreeNode(3)), TreeNode(-3, TreeNode(-2))), 2)); // true

  print(Solution().hasPathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 5)); // false
  print(Solution().hasPathSum(null, 0)); // false
  print(Solution().hasPathSum(TreeNode(1), 2)); // false
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 5)); // false
  print(Solution().hasPathSum(TreeNode(1, null, TreeNode(2, null, TreeNode(3))), 5)); // false
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3)), 100)); // false
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 3)); // false
  print(Solution().hasPathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 2)); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool hasPathSum(final TreeNode? root, int targetSum) {
    if (root == null) return false;

    targetSum -= root.val;
    if (root.left == null && root.right == null) {
      if (targetSum == 0) return true;
    }

    return hasPathSum(root.left, targetSum) || hasPathSum(root.right, targetSum);
  }
}

// class Solution {
//   bool hasPathSum(final TreeNode? root, int targetSum) {
//
//     bool dfs(final TreeNode? node, int sum) {
//       if (node == null) return false;
//
//       sum += node.val;
//
//       if (node.left == null && node.right == null) {
//         if (sum == targetSum) return true;
//       }
//
//       return dfs(node.left, sum) || dfs(node.right, sum);
//     }
//
//     return dfs(root, 0);
//   }
// }

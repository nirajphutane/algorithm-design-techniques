
import 'dart:math';

void main(final List<String> args) {
  print(Solution().maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // 3
  print(Solution().maxDepth(TreeNode(1, null, TreeNode(2)))); // 2

  print(Solution().maxDepth(null)); // 0
  print(Solution().maxDepth(TreeNode(1))); // 1
  print(Solution().maxDepth(TreeNode(1, TreeNode(2), null))); // 2
  print(Solution().maxDepth(TreeNode(1, null, TreeNode(2)))); // 2
  print(Solution().maxDepth(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // 3
  print(Solution().maxDepth(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // 3
  print(Solution().maxDepth(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))))); // 3
  print(Solution().maxDepth(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), null), null), null))); // 4
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(final TreeNode? root) {
    if (root == null) return 0;

    return max(maxDepth(root.left), maxDepth(root.right)) + 1;
  }
}

// class Solution {
//
//   int maxDepth(final TreeNode? root) {
//     if (root == null) return 0;
//
//     final int leftHeight = maxDepth(root.left);
//     final int rightHeight = maxDepth(root.right);
//
//     return max(leftHeight, rightHeight) + 1;
//   }
// }
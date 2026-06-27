
import 'dart:collection';
import 'dart:math';

void main (final List<String> args) {
  print(Solution().isBalanced(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))));  // true
  print(Solution().isBalanced(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2))));  // false

  print(Solution().isBalanced(null)); // true
  print(Solution().isBalanced(TreeNode(1))); // true
  print(Solution().isBalanced(TreeNode(1,TreeNode(2),TreeNode(3)))); // true
  print(Solution().isBalanced(TreeNode(3,TreeNode(9),TreeNode(20,TreeNode(15),TreeNode(7))))); // true
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(4),TreeNode(5)),TreeNode(3,TreeNode(6),TreeNode(7))))); // true
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3),null),TreeNode(4)))); // true
  print(Solution().isBalanced(TreeNode(1,TreeNode(2),TreeNode(3,null,TreeNode(4))))); // true
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(4),null),TreeNode(3)))); // true

  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3))))); // false
  print(Solution().isBalanced(TreeNode(1,null,TreeNode(2,null,TreeNode(3))))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4)))))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4),TreeNode(4)),TreeNode(3)),TreeNode(2)))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3),null),null))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4),null),null),TreeNode(5)))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2),TreeNode(3,null,TreeNode(4,null,TreeNode(5)))))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3))))); // false
  print(Solution().isBalanced(TreeNode(1,null,TreeNode(2,null,TreeNode(3))))); // false
  print(Solution().isBalanced(TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4),TreeNode(4)),TreeNode(3)),TreeNode(2)))); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isBalanced(final TreeNode? root) {

    return false;
  }
}

// class Solution {
//   bool isBalanced (final TreeNode? root) {
//
//     int dfs(final TreeNode? node) {
//       if (node == null) return 0;
//
//       final left = dfs(node.left);
//       if (left == -1) return -1;
//
//       final right = dfs(node.right);
//       if (right == -1) return -1;
//
//       if ((left-right).abs() > 1) return -1;
//
//       return max(left, right) + 1;
//     }
//
//     return dfs(root) != -1;
//   }
// }

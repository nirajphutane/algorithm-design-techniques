
void main() {
  print(Solution().kthSmallest(TreeNode(3, TreeNode(1, null, TreeNode(2)), TreeNode(4)), 1)); // 1
  print(Solution().kthSmallest(TreeNode(5, TreeNode(3, TreeNode(2, TreeNode(1)), TreeNode(4)), TreeNode(6)), 3)); // 3

  print(Solution().kthSmallest(TreeNode(0, TreeNode(-3, TreeNode(-4), TreeNode(-2)), TreeNode(2, TreeNode(1), TreeNode(3))), 4)); // 0
  print(Solution().kthSmallest(TreeNode(1), 1)); // 1
  print(Solution().kthSmallest(TreeNode(2, TreeNode(1), TreeNode(3)), 2)); // 2
  print(Solution().kthSmallest(TreeNode(3, TreeNode(2, TreeNode(1), null), null), 2)); // 2
  print(Solution().kthSmallest(TreeNode(1, null, TreeNode(2, null, TreeNode(3))), 3)); // 3
  print(Solution().kthSmallest(TreeNode(5, TreeNode(3, TreeNode(2, TreeNode(1)), TreeNode(4)), TreeNode(6)), 6)); // 6
  print(Solution().kthSmallest(TreeNode(8, TreeNode(3, TreeNode(1), TreeNode(6, TreeNode(4), TreeNode(7))), TreeNode(10, null, TreeNode(14, TreeNode(13), null))), 5)); // 7
  print(Solution().kthSmallest(TreeNode(10, TreeNode(5, TreeNode(2), TreeNode(7)), TreeNode(15)), 4)); // 10
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {

  int kthSmallest(final TreeNode? root, int k) {

    int dfs(final TreeNode? node) {
      if (node == null) return -1;

      final left = dfs(node.left);
      if (left != -1) return left;

      if (--k == 0) return node.val;

      return dfs(node.right);
    }

    return dfs(root);
  }
}

// class Solution {
//
//   final List<TreeNode> _stack = [];
//
//   int kthSmallest(TreeNode? root, int k) {
//     _push(root);
//     while (_stack.isNotEmpty) {
//       k--;
//       if (k == 0) {
//         break;
//       }
//       _push(_stack.removeLast().right);
//     }
//     return _stack.last.val;
//   }
//
//   void _push(TreeNode? root) {
//     while (root != null) {
//       _stack.add(root);
//       root = root.left;
//     }
//   }
// }

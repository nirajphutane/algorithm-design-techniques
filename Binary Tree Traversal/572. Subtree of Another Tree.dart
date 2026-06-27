
void main(final List<String> args) {
  print(Solution().isSubtree(TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2)), TreeNode(5)), TreeNode(4, TreeNode(1), TreeNode(2)))); // true
  print(Solution().isSubtree(TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2, TreeNode(0), null)), TreeNode(5)), TreeNode(4, TreeNode(1), TreeNode(2)))); // false

  print(Solution().isSubtree(TreeNode(1), TreeNode(1))); // true
  print(Solution().isSubtree(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(2))); // true
  print(Solution().isSubtree(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(3))); // true
  print(Solution().isSubtree(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(1, TreeNode(2), TreeNode(3)))); // true
  print(Solution().isSubtree(TreeNode(1, TreeNode(2, TreeNode(4), null), TreeNode(3)), TreeNode(2, TreeNode(4), null))); // true

  print(Solution().isSubtree(TreeNode(1), TreeNode(2))); // false
  print(Solution().isSubtree(TreeNode(1, TreeNode(2, TreeNode(4), null), TreeNode(3)), TreeNode(2, null, TreeNode(4)))); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSubtree(final TreeNode? root, final TreeNode? subRoot) {

    if (root == null) return false;

    bool isSame(final TreeNode? root, final TreeNode? subRoot) {
      if (root == null && subRoot == null) return true;

      if (root?.val == subRoot?.val) {
        return isSame(root?.left, subRoot?.left) && isSame(root?.right, subRoot?.right);
      }

      return false;
    }

    return isSame(root, subRoot) || isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
  }
}

// class Solution {
//   bool isSubtree(final TreeNode? root, final TreeNode? subRoot) {
//
//     bool isSame(final TreeNode? node1, final TreeNode? node2) {
//       if (node1 == null && node2 == null) return true;
//
//       if (node1 == null || node2 == null) return false;
//
//       return (node1.val == node2.val) && isSame(node1.left, node2.left) && isSame(node1.right, node2.right);
//     }
//
//     bool dfs(final TreeNode? node1, final TreeNode? node2) {
//       if (node1 == null) return false;
//
//       if (node2 == null) return true;
//
//       return isSame(node1, node2) || dfs(node1.left, node2) || dfs(node1.right, node2);
//     }
//
//     return dfs(root, subRoot);
//   }
// }

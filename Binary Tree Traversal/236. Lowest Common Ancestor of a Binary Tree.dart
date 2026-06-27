
void main(final List<String> args) {
  TreeNode p = TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))), q = TreeNode(1, TreeNode(0), TreeNode(8));
  print(Solution().lowestCommonAncestor(TreeNode(3, p, q), p, q)?.val); // 3
  p = TreeNode(4);
  q = TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), p));
  print(Solution().lowestCommonAncestor(TreeNode(3, q, TreeNode(1, TreeNode(0), TreeNode(8))), p, q)?.val); // 5
  p = TreeNode(2);
  q = TreeNode(1, p);
  print(Solution().lowestCommonAncestor(q, q, p)?.val); // 1

  p = TreeNode(0);
  q = TreeNode(8);
  print(Solution().lowestCommonAncestor(TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))), TreeNode(1, p, q)), p, q)?.val); // 1
  p = TreeNode(7);
  q = TreeNode(4);
  print(Solution().lowestCommonAncestor(TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, p, q)), TreeNode(1, TreeNode(0), TreeNode(8))), p, q)?.val); // 2
  p = TreeNode(6);
  q = TreeNode(8);
  print(Solution().lowestCommonAncestor(TreeNode(3, TreeNode(5, p, TreeNode(2, TreeNode(7), TreeNode(4))), TreeNode(1, TreeNode(0), q)), p, q)?.val); // 3
  p = TreeNode(6);
  q = TreeNode(4);
  print(Solution().lowestCommonAncestor(TreeNode(3, TreeNode(5, p, TreeNode(2, TreeNode(7), q)), TreeNode(1, TreeNode(0), TreeNode(8))), p, q)?.val); // 5
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? lowestCommonAncestor(final TreeNode root, final TreeNode p, final TreeNode q) {

    TreeNode? dfs(final TreeNode? node) {
      if (node == null) return null;

      if (node == p || node == q) {
        return node;
      }

      final left = dfs(node.left);
      final right = dfs(node.right);

      if (left != null && right != null) return node;

      if (left != null) return left;

      return right;
    }

    return dfs(root);
  }
}
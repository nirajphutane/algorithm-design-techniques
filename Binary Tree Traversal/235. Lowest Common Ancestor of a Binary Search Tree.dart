
void main() {
  TreeNode p = TreeNode(2), q = TreeNode(8);
  print(Solution().lowestCommonAncestor(TreeNode(6, p, q), p, q)?.val); // 6
  p = TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5)));
  q = p.right!;
  print(Solution().lowestCommonAncestor(TreeNode(6, p, TreeNode(8, TreeNode(7), TreeNode(9))), p, q)?.val); // 2

  p = TreeNode(2);
  print(Solution().lowestCommonAncestor(TreeNode(2, p), TreeNode(2), p)?.val); // 2
  print(Solution().lowestCommonAncestor(TreeNode(3, TreeNode(1), TreeNode(5)), TreeNode(1), TreeNode(5))?.val); // 3
  print(Solution().lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(3), TreeNode(5))?.val); // 4
  print(Solution().lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(4), TreeNode(5))?.val); // 4
  print(Solution().lowestCommonAncestor(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(2), TreeNode(9))?.val); // 5
  print(Solution().lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(0), TreeNode(9))?.val); // 6
  print(Solution().lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(7), TreeNode(9))?.val); // 8
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? lowestCommonAncestor(final TreeNode? root, final TreeNode p, final TreeNode q) {

    if (root == null) return null;

    if (p.val < root.val && q.val < root.val) return lowestCommonAncestor(root.left, p, q);

    if (p.val > root.val && q.val > root.val) return lowestCommonAncestor(root.right, p, q);

    return root;
  }
}
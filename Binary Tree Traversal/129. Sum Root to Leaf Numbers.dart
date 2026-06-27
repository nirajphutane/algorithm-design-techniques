
void main() {
  print(Solution().sumNumbers(TreeNode(1, TreeNode(2), TreeNode(3))));  // 25
  print(Solution().sumNumbers(TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))));  // 1026

  print(Solution().sumNumbers(null)); // 0
  print(Solution().sumNumbers(TreeNode(5))); // 5
  print(Solution().sumNumbers(TreeNode(2, TreeNode(0), TreeNode(1)))); // 41
  print(Solution().sumNumbers(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // 123
  print(Solution().sumNumbers(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // 123
  print(Solution().sumNumbers(TreeNode(9, TreeNode(9), TreeNode(1)))); // 190
  print(Solution().sumNumbers(TreeNode(1, TreeNode(0, TreeNode(5), TreeNode(1)), TreeNode(9)))); // 225
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {

  int sumNumbers(final TreeNode? root) {

    int dfs(final TreeNode? node, int num) {
      if (node == null) return 0;

      num = (num * 10) + node.val;

      if (node.left == null && node.right == null) return num;

      final left = dfs(node.left, num);
      final right = dfs(node.right, num);

      return left + right;
    }

    return dfs(root, 0);
  }

}


import 'dart:math';

void main(final List<String> args) {
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3)))); // 3
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2)))); // 1

  print(Solution().diameterOfBinaryTree(null)); // 0
  print(Solution().diameterOfBinaryTree(TreeNode(1))); // 0
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2), TreeNode(3)))); // 2
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // 2
  print(Solution().diameterOfBinaryTree(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // 2
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), null), null), null))); // 3
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))))); // 4
  print(Solution().diameterOfBinaryTree(TreeNode(1, TreeNode(2, TreeNode(4), null), TreeNode(3, null, TreeNode(5))))); // 4
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int diameterOfBinaryTree(final TreeNode? root) {

    Map<String, int> dfs(final TreeNode? node) {
      if (node == null) return {'Height': 0, 'Diameter': 0};

      final Map<String, int> leftMap = dfs(node.left);
      final Map<String, int> rightMap = dfs(node.right);

      final int height = max(leftMap['Height']!, rightMap['Height']!) + 1;
      final int diameter = [leftMap['Diameter']!, rightMap['Diameter']!, leftMap['Height']! + rightMap['Height']!].reduce(max);
      return {'Height': height, 'Diameter': diameter};
    }
    return dfs(root)['Diameter']!;
  }
}
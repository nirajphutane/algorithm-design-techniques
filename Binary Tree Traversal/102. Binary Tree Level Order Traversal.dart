
import 'dart:collection';

void main() {
  print(Solution().levelOrder(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // [[3],[9,20],[15,7]]
  print(Solution().levelOrder(TreeNode(1))); // [[1]]
  print(Solution().levelOrder(null)); // []

  print(Solution().levelOrder(TreeNode(1, TreeNode(2), TreeNode(3)))); // [[1], [2, 3]]
  print(Solution().levelOrder(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))))); // [[1], [2, 3], [4, 5, 6, 7]]
  print(Solution().levelOrder(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // [[1], [2], [3]]
  print(Solution().levelOrder(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // [[1], [2], [3]]
  print(Solution().levelOrder(TreeNode(5, TreeNode(4, TreeNode(3), null), TreeNode(6, null, TreeNode(7))))); // [[5], [4, 6], [3, 7]]
  print(Solution().levelOrder(TreeNode(10, TreeNode(5), TreeNode(15, TreeNode(12), TreeNode(20))))); // [[10], [5, 15], [12, 20]]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(final TreeNode? root) {
    if (root == null) return [];

    final List<List<int>> levels = [];
    List<int> level = [];

    final Queue<TreeNode?> queue = Queue();
    queue.add(root);
    queue.add(null);

    while(queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        levels.add(List.of(level));
        level = [];
        if (queue.isNotEmpty) {
          queue.add(null);
        }
      } else {
        level.add(node.val);
        if (node.left != null) queue.add(node.left);
        if (node.right != null) queue.add(node.right);
      }
    }

    return levels;
  }
}


import 'dart:collection';

void main() {
  print(Solution().levelOrderBottom(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // [[15,7],[9,20],[3]]
  print(Solution().levelOrderBottom(TreeNode(1))); // [1]
  print(Solution().levelOrderBottom(null)); // []

  print(Solution().levelOrderBottom(TreeNode(1, TreeNode(2), TreeNode(3)))); // [[2, 3], [1]]
  print(Solution().levelOrderBottom(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))))); // [[4, 5, 6, 7], [2, 3], [1]]
  print(Solution().levelOrderBottom(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // [[3], [2], [1]]
  print(Solution().levelOrderBottom(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // [[3], [2], [1]]
  print(Solution().levelOrderBottom(TreeNode(5, TreeNode(4, TreeNode(3), null), TreeNode(6, null, TreeNode(7))))); // [[3, 7], [4, 6], [5]]
  print(Solution().levelOrderBottom(TreeNode(10, TreeNode(5), TreeNode(15, TreeNode(12), TreeNode(20))))); // [[12, 20], [5, 15], [10]]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrderBottom(final TreeNode? root) {

    if (root == null) return [];

    final List<List<int>> levels = [];
    List<int> level = [];

    final Queue<TreeNode?> queue = Queue();
    queue.add(root);
    queue.add(null);
    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        levels.add(List<int>.of(level));
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

    return levels.reversed.toList(growable: false);
  }
}

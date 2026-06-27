
import 'dart:collection';

void main() {
  print(Solution().zigzagLevelOrder(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))); // [[3],[20,9],[15,7]]
  print(Solution().zigzagLevelOrder(TreeNode(1))); // [1]
  print(Solution().zigzagLevelOrder(null)); // []

  print(Solution().zigzagLevelOrder(TreeNode(1, TreeNode(2), TreeNode(3)))); // [[1], [3, 2]]
  print(Solution().zigzagLevelOrder(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))))); // [[1], [3, 2], [4, 5, 6, 7]]
  print(Solution().zigzagLevelOrder(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // [[1], [2], [3]]
  print(Solution().zigzagLevelOrder(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // [[1], [2], [3]]
  print(Solution().zigzagLevelOrder(TreeNode(5, TreeNode(4, TreeNode(3), null), TreeNode(6, null, TreeNode(7))))); // [[5], [6, 4], [3, 7]]
  print(Solution().zigzagLevelOrder(TreeNode(10, TreeNode(5), TreeNode(15, TreeNode(12), TreeNode(20))))); // [[10], [15, 5], [12, 20]]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> zigzagLevelOrder(final TreeNode? root) {
    if (root == null) return [];

    final List<List<int>> levels = [];
    List<int> level = [];

    bool isFromLeftToRight = true;
    final Queue<TreeNode?> queue = Queue();
    queue.add(root);
    queue.add(null);
    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        if (isFromLeftToRight) {
          levels.add(List<int>.of(level));
        } else {
          levels.add(List<int>.of(level.reversed));
        }
        level = [];
        isFromLeftToRight = !isFromLeftToRight;
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

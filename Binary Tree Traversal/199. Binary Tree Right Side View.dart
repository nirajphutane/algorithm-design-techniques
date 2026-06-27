
import 'dart:collection';

void main(final List<String> args) {
  print(Solution().rightSideView(TreeNode(1, TreeNode(2, null, TreeNode(5)), TreeNode(3, null, TreeNode(4))))); // [1, 3, 4]
  print(Solution().rightSideView(TreeNode(1, null, TreeNode(3)))); // [1, 3]
  print(Solution().rightSideView(null)); // []

  print(Solution().rightSideView(TreeNode(1))); // [1]
  print(Solution().rightSideView(TreeNode(1, TreeNode(2), null))); // [1, 2]
  print(Solution().rightSideView(TreeNode(1, null, TreeNode(2)))); // [1, 2]
  print(Solution().rightSideView(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3)))); // [1, 3, 5]
  print(Solution().rightSideView(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), null), null), null))); // [1, 2, 3, 4]
  print(Solution().rightSideView(TreeNode(1, TreeNode(2), TreeNode(3, TreeNode(4), TreeNode(5))))); // [1, 3, 5]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> rightSideView(final TreeNode? root) {
    if (root == null) return [];

    final List<int> list = [];

    final Queue<TreeNode?> queue = Queue();
    queue.add(root);
    queue.add(null);

    TreeNode? mostRightNode = root;
    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeFirst();
      if (node == null) {
        list.add(mostRightNode!.val);
        mostRightNode = null;
        if (queue.isNotEmpty) queue.add(null);
      } else {
        mostRightNode = node;
        if (node.left != null) queue.add(node.left);

        if (node.right != null) queue.add(node.right);
      }
    }

    return list;
  }
}
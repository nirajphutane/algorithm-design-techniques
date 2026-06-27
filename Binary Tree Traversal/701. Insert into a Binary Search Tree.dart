
void main(final List<String> args) {
  print(Solution().insertIntoBST(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7)), 5).toString()); // [4, 2, 7, 1, 3, 5]
  print(Solution().insertIntoBST(TreeNode(40, TreeNode(20, TreeNode(10), TreeNode(30)), TreeNode(60, TreeNode(50), TreeNode(70))), 25).toString()); // [40, 20, 60, 10, 30, 50, 70, null, null, 25]

  print(Solution().insertIntoBST(null, 1).toString()); // [1]
  print(Solution().insertIntoBST(TreeNode(2), 1).toString()); // [2, 1]
  print(Solution().insertIntoBST(TreeNode(2), 3).toString()); // [2, null, 3]
  print(Solution().insertIntoBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 6).toString()); // [5, 3, 8, 2, 4, 7, 9, null, null, null, null, 6]
  print(Solution().insertIntoBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 10).toString()); // [5, 3, 8, 2, 4, 7, 9, null, null, null, null, null, null, null, 10]
  print(Solution().insertIntoBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 0).toString()); // [5, 3, 8, 2, 4, 7, 9, 0]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
    final List<int?> list = [];
    final List<TreeNode?> queue = [];

    queue.add(this);
    while (queue.isNotEmpty) {
      final TreeNode? node = queue.removeAt(0);
      list.add(node?.val);
      if (node != null) {
        queue.add(node.left);
        queue.add(node.right);
      }
    }

    while (list.isNotEmpty && list.last == null)
      list.removeLast();

    return list.toString();
  }
}

class Solution {
  TreeNode? insertIntoBST(TreeNode? root, final int val) {
    if (root == null) return TreeNode(val);

    if (val < root.val) root.left = insertIntoBST(root.left, val);
    else if (val > root.val) root.right = insertIntoBST(root.right, val);

    return root;
  }
}

void main(final List<String> args) {
  print(Solution().searchBST(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7)), 2).toString()); // [2,1,3]
  print(Solution().searchBST(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7)), 5).toString()); // null

  print(Solution().searchBST(null, 1).toString()); // null
  print(Solution().searchBST(TreeNode(1), 1).toString()); // [1]
  print(Solution().searchBST(TreeNode(1), 2).toString()); // null
  print(Solution().searchBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 5).toString()); // [5,3,8,2,4,7,9]
  print(Solution().searchBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 4).toString()); // [4]
  print(Solution().searchBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 8).toString()); // [8,7,9]
  print(Solution().searchBST(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 9).toString()); // [9]
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
  TreeNode? searchBST(final TreeNode? root, final int val) {
    if (root == null) return null;

    if (val == root.val) return root;
    if (val < root.val) return searchBST(root.left, val);
    if (val > root.val) return searchBST(root.right, val);

    return null;
  }
}

// class Solution {
//   TreeNode? searchBST(final TreeNode? root, final int val) {
//
//     TreeNode? dfs(final TreeNode? node) {
//       if (node == null) return null;
//
//       if(val == node.val) return node;
//
//       if (val < node.val) return dfs(node.left);
//
//       return dfs(node.right);
//     }
//
//     return dfs(root);
//   }
// }
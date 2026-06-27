
void main(final List<String> args) {
  print(Solution().binaryTreePaths(TreeNode(1, TreeNode(2, null, TreeNode(5)), TreeNode(3)))); // ['1->2->5','1->3']
  print(Solution().binaryTreePaths(TreeNode(1))); // ['1']

  print(Solution().binaryTreePaths(TreeNode(1, TreeNode(2, TreeNode(3), null), null))); // ['1->2->3']
  print(Solution().binaryTreePaths(TreeNode(1, null, TreeNode(2, null, TreeNode(3))))); // ['1->2->3']
  print(Solution().binaryTreePaths(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))))); // ['1->2->4','1->2->5','1->3->6','1->3->7']
  print(Solution().binaryTreePaths(TreeNode(-1, TreeNode(-2), TreeNode(-3)))); // ['-1->-2','-1->-3']
  print(Solution().binaryTreePaths(null)); // []
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<String> binaryTreePaths(final TreeNode? root) {

    final List<String> paths = [];

    void dfs(final TreeNode? node, String path) {
      if (node == null) return;

      path += '${node.val}';

      if (node.left == null && node.right == null) paths.add(path);

      dfs(node.left, '$path->');
      dfs(node.right, '$path->');
    }

    dfs(root, '');
    return paths;
  }
}

// class Solution {
//   List<String> binaryTreePaths(TreeNode? root) {
//     if (root == null) return [];
//
//     final List<String> paths = [];
//     final String path = '${root.val}';
//
//     void dp(final TreeNode? node, final String path) {
//
//       if (node?.left == null && node?.right == null) {
//         paths.add(path);
//         return;
//       }
//
//       if (node?.left != null) dp(node?.left, path+'->${node?.left?.val}');
//       if (node?.right != null) dp(node?.right, path+'->${node?.right?.val}');
//     }
//
//     dp(root, path);
//     return paths;
//   }
// }
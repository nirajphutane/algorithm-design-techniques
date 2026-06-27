
void main() {
  print(Solution().postorderTraversal(TreeNode(1, null, TreeNode(2, TreeNode(3)))));  // [3,2,1]
  print(Solution().postorderTraversal(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5, TreeNode(6), TreeNode(7))), TreeNode(3, null, TreeNode(8, TreeNode(9))))));  // [4,6,7,5,2,9,8,3,1]
  print(Solution().postorderTraversal(null));   // []
  print(Solution().postorderTraversal(TreeNode(1)));  // [1]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> postorderTraversal(final TreeNode? root) {

    final List<int> items = [];
    void dfs(final TreeNode? node) {
      if (node == null) return;

      dfs(node.left);
      dfs(node.right);
      items.add(node.val);
    }

    dfs(root);
    return items;
  }
}

void main() {
  print(Solution().preorderTraversal(TreeNode(1, null, TreeNode(2, TreeNode(3)))));  // [1,2,3]
  print(Solution().preorderTraversal(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5, TreeNode(6), TreeNode(7))), TreeNode(3, null, TreeNode(8, TreeNode(9))))));  // [1,2,4,5,6,7,3,8,9]
  print(Solution().preorderTraversal(null));   // []
  print(Solution().preorderTraversal(TreeNode(1)));  // [1]
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> preorderTraversal(final TreeNode? root) {
    final List<int> items = [];
    void dfs(final TreeNode? node) {
      if (node == null) return;

      items.add(node.val);
      dfs(node.left);
      dfs(node.right);
    }

    dfs(root);
    return items;
  }
}
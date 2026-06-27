
void main(final List<String> args) {
  print(Solution().invertTree(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7, TreeNode(6), TreeNode(9)))).toString()); // [4,7,2,9,6,3,1]
  print(Solution().invertTree(TreeNode(2, TreeNode(1), TreeNode(3))).toString()); // [2,3,1]
  print(Solution().invertTree(TreeNode()).toString()); // [0]

  print(Solution().invertTree(TreeNode(1)).toString()); // [1]
  print(Solution().invertTree(TreeNode(1, TreeNode(2), null)).toString()); // [1,null,2]
  print(Solution().invertTree(TreeNode(1, null, TreeNode(2))).toString()); // [1,2]
  print(Solution().invertTree(TreeNode(1, TreeNode(2, TreeNode(3), null), null)).toString()); // [1,null,2,null,3]
  print(Solution().invertTree(TreeNode(1, null, TreeNode(2, null, TreeNode(3)))).toString()); // [1,2,null,3]
  print(Solution().invertTree(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9)))).toString()); // [5,8,3,9,7,4,2]
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
  TreeNode? invertTree(final TreeNode? root) {

    void dfs(final TreeNode? node) {
      if (node == null) return;

      final TreeNode? tmp = node.left;
      node.left = node.right;
      node.right = tmp;

      dfs(node.left);
      dfs(node.right);
    }

    dfs(root);
    return root;
  }
}

void main(final List<String> args) {
  print(Solution().isValidBST(TreeNode(2,TreeNode(1),TreeNode(3)))); // true
  print(Solution().isValidBST(TreeNode(5,TreeNode(1),TreeNode(4,TreeNode(3),TreeNode(6))))); // false

  print(Solution().isValidBST(TreeNode(5,TreeNode(3,TreeNode(2),TreeNode(4)),TreeNode(7,TreeNode(6),TreeNode(8))))); // true
  print(Solution().isValidBST(TreeNode(1))); // true
  print(Solution().isValidBST(null)); // true
  print(Solution().isValidBST(TreeNode(10,TreeNode(5,TreeNode(2),TreeNode(8)),TreeNode(15,TreeNode(12),TreeNode(20))))); // true
  print(Solution().isValidBST(TreeNode(2147483647))); // true
  print(Solution().isValidBST(TreeNode(-2147483648))); // true

  print(Solution().isValidBST(TreeNode(2,TreeNode(2),TreeNode(3)))); // false
  print(Solution().isValidBST(TreeNode(2,TreeNode(1),TreeNode(2)))); // false
  print(Solution().isValidBST(TreeNode(10,TreeNode(5),TreeNode(15,TreeNode(6),TreeNode(20))))); // false
  print(Solution().isValidBST(TreeNode(10,TreeNode(5,TreeNode(2),TreeNode(12)),TreeNode(15)))); // false
  print(Solution().isValidBST(TreeNode(5,TreeNode(6),TreeNode(7)))); // false
  print(Solution().isValidBST(TreeNode(5,TreeNode(3),TreeNode(4)))); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isValidBST(final TreeNode? root) {
    const int MIN = (-1 << 31) -1, MAX = 1 << 31;

    bool dfs(final TreeNode? node, final int min, final int max) {

      if (node == null) return true;

      if (min < node.val && node.val < max) {
        return dfs(node.left, min, node.val) && dfs(node.right, node.val, max);
      }

      return false;
    }

    return dfs(root, MIN, MAX);
  }
}

// class Solution {
//
//   bool isValidBST(final TreeNode? root) {
//     const int MIN = (-1 << 31) -1, MAX = 1 << 31;
//
//     bool dfs(final TreeNode? node, final int min, final int max) {
//       if (node == null) return true;
//
//       if(node.val <= min || node.val >= max) return false;
//
//       return dfs(node.left, min, node.val) && dfs(node.right, node.val, max);
//     }
//
//     return dfs(root, MIN, MAX);
//   }
// }
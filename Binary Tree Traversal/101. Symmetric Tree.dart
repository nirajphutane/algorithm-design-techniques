
void main(final List<String> args) {
  print(Solution().isSymmetric(TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3))))); // true
  print(Solution().isSymmetric(TreeNode(1, TreeNode(2, null, TreeNode(3)), TreeNode(2, null, TreeNode(3))))); // false

  print(Solution().isSymmetric(null)); // true
  print(Solution().isSymmetric(TreeNode(1))); // true
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2),TreeNode(2)))); // true
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3),TreeNode(4)),TreeNode(2,TreeNode(4),TreeNode(3))))); // true
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3),null),TreeNode(2,null,TreeNode(3))))); // true
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4),null),null),TreeNode(2,null,TreeNode(3,null,TreeNode(4)))))); // true
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3),TreeNode(4)),TreeNode(2,TreeNode(4),TreeNode(3))))); // true

  print(Solution().isSymmetric(TreeNode(1,TreeNode(2),TreeNode(3)))); // false
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3),TreeNode(4)),TreeNode(2,TreeNode(3),TreeNode(4))))); // false
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,null,TreeNode(3)),TreeNode(2,null,TreeNode(3))))); // false
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3),null),TreeNode(2,TreeNode(3),null)))); // false
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3),TreeNode(4)),TreeNode(2,TreeNode(4),TreeNode(5))))); // false
  print(Solution().isSymmetric(TreeNode(1,TreeNode(2,TreeNode(3,TreeNode(4),null),null),TreeNode(2,null,TreeNode(3,TreeNode(5),null))))); // false
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSymmetric(final TreeNode? root) {

    bool dfs(final TreeNode? left, final TreeNode? right) {
      if (left == null && right == null) return true;

      if (left?.val == right?.val) {
        return dfs(left?.left, right?.right) && dfs(left?.right, right?.left);
      }

      return false;
    }

    return dfs(root?.left, root?.right);
  }
}

// class Solution {
//   bool isSymmetric(final TreeNode? root) {
//
//     bool dfs(final TreeNode? left, final TreeNode? right) {
//       if (left == null && right == null) return true;
//
//       if (left == null || right == null) return false;
//
//       if (left.val == right.val) {
//         return dfs(left.left, right.right) && dfs(left.right, right.left);
//       }
//
//       return false;
//     }
//
//     return dfs(root?.left, root?.right);
//   }
// }


void main(final List<String> args) {
  print(Solution().pathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1)))), 22)); // [[5,4,11,2],[5,8,4,5]]
  print(Solution().pathSum(TreeNode(1, TreeNode(2), TreeNode(3)), 5)); // []
  print(Solution().pathSum(null, 0)); // []

  print(Solution().pathSum(TreeNode(1), 1)); // [[1]]
  print(Solution().pathSum(TreeNode(1), 2)); // []
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 6)); // [[1,2,3]]
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 5)); // []
  print(Solution().pathSum(TreeNode(1, null, TreeNode(2, null, TreeNode(3))), 6)); // [[1,2,3]]
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7))), 7)); // [[1,2,4]]
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(5)), 7)); // [[1,2,4]]
  print(Solution().pathSum(TreeNode(-2, null, TreeNode(-3)), -5)); // [[-2,-3]]
  print(Solution().pathSum(TreeNode(1, TreeNode(-2, TreeNode(1, TreeNode(-1)), TreeNode(3)), TreeNode(-3, TreeNode(-2))), -1)); // [[1,-2,1,-1]]
  print(Solution().pathSum(TreeNode(0), 0)); // [[0]]
  print(Solution().pathSum(TreeNode(0, TreeNode(0), TreeNode(0)), 0)); // [[0,0],[0,0]]
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3))), 3)); // []
  print(Solution().pathSum(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4, TreeNode(5))))), 15)); // [[1,2,3,4,5]]
  print(Solution().pathSum(TreeNode(1, TreeNode(1, TreeNode(1), TreeNode(1)), TreeNode(1)), 3)); // [[1,1,1],[1,1,1]]
  print(Solution().pathSum(null, 10)); // []
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> pathSum(final TreeNode? root, final int targetSum) {
    final List<List<int>> paths = [];
    final List<int> path = [];

    void dfs(final TreeNode? node, int targetSum) {
      if (node == null) return;

      targetSum -= node.val;
      path.add(node.val);
      if (node.left == null && node.right == null) {
        if (targetSum == 0) paths.add(List<int>.of(path));
      }

      dfs(node.left, targetSum);
      dfs(node.right, targetSum);
      path.removeLast();
    }

    dfs(root, targetSum);

    return paths;
  }
}

/*class Solution {
  List<List<int>> pathSum(final TreeNode? root, final int targetSum) {

    final List<List<int>> paths = [];

    void dfs(final TreeNode? node, final List<int> path, int sum) {
      if (node == null) return;

      sum += node.val;
      path.add(node.val);

      if (node.left == null && node.right == null) {
        if (sum == targetSum) paths.add(List<int>.of(path));
      }

      dfs(node.left, path, sum);
      dfs(node.right, path, sum);

      path.removeLast();
    }

    dfs(root, [], 0);
    return paths;
  }
}*/

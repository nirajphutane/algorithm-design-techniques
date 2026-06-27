
void main(final List<String> args) {
  print(Solution().deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(6, null, TreeNode(7))), 3).toString()); // [5,4,6,2,null,null,7]
  print(Solution().deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(6, null, TreeNode(7))), 0).toString()); // [5,3,6,2,4,null,7]
  print(Solution().deleteNode(null, 0).toString()); // null

  print(Solution().deleteNode(TreeNode(1), 1).toString()); // null
  print(Solution().deleteNode(TreeNode(2, TreeNode(1), TreeNode(3)), 1).toString()); // [2,null,3]
  print(Solution().deleteNode(TreeNode(2, TreeNode(1), TreeNode(3)), 3).toString()); // [2,1]
  print(Solution().deleteNode(TreeNode(2, TreeNode(1), TreeNode(3)), 2).toString()); // [3,1]
  print(Solution().deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 8).toString()); // [5,3,9,2,4,7]
  print(Solution().deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(8, TreeNode(7), TreeNode(9))), 5).toString()); // [7,3,8,2,4,null,9]
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
  TreeNode? deleteNode(final TreeNode? root, final int key) {

    TreeNode inorderSuccessor(TreeNode? node) {
      while (node?.left != null) {
        node = node?.left;
      }
      return node!;
    }

    TreeNode? delete(final TreeNode? node, final int value) {
      if (node == null) return null;

      if (value < node.val) {
        node.left = delete(node.left, value);
      } else if (value > node.val) {
        node.right = delete(node.right, value);
      } else {
        if (node.left == null && node.right == null) {
          return null;
        } else if (node.left == null) {
          return node.right;
        } else if (node.right == null) {
          return node.left;
        } else {
          final TreeNode successor = inorderSuccessor(node.right);
          node.val = successor.val;
          node.right = delete(node.right, successor.val);
        }
      }
      return node;
    }

    return delete(root, key);
  }
}

// class Solution {
//   TreeNode? deleteNode(final TreeNode? root, final int key) {
//
//     TreeNode inorderSuccessor(TreeNode? node) {
//       while (node?.left != null) {
//         node = node?.left;
//       }
//       return node!;
//     }
//
//     TreeNode? delete(final TreeNode? node, final int value) {
//       if (node == null) return null;
//
//       if (value < node.val) node.left = delete(node.left, value);
//       else if (value > node.val) node.right = delete(node.right, value);
//       else {
//         if (node.left == null && node.right == null) return null;
//         else if (node.left == null) return node.right;
//         else if (node.right == null) return node.left;
//         else {
//           node.val = inorderSuccessor(node.right).val;
//           node.right = delete(node.right, node.val);
//         }
//       }
//       return node;
//     }
//
//     return delete(root, key);
//   }
// }
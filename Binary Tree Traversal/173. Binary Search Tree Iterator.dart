
void main() {
  final BSTIterator bstIterator = BSTIterator(TreeNode(7, TreeNode(3), TreeNode(15, TreeNode(9), TreeNode(20))));
  print(bstIterator.next());    // 3
  print(bstIterator.next());    // 7
  print(bstIterator.hasNext()); // true
  print(bstIterator.next());    // 9
  print(bstIterator.hasNext()); // true
  print(bstIterator.next());    // 15
  print(bstIterator.hasNext()); // true
  print(bstIterator.next());    // 20
  print(bstIterator.hasNext()); // false
  // print(bstIterator.next());    // crash
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class BSTIterator {

  BSTIterator(final TreeNode root);

  bool hasNext() => false;

  int next() => -1;
}

/*
class BSTIterator {

  final List<TreeNode> stack = [];

  BSTIterator(TreeNode? root) {
    _buildStack(root);
  }

  int next() {
    final TreeNode node = stack.removeLast();
    if (stack.isEmpty) {
      _buildStack(node.right);
    }
    return node.val;
  }

  bool hasNext() => stack.isNotEmpty;

  void _buildStack(TreeNode? node) {
    while (node != null) {
      stack.add(node);
      node = node.left;
    }
  }
}*/

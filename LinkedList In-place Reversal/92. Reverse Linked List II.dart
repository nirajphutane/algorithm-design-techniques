

void main() {
  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 2, 4).toString()); // head --> 1 --> 4 --> 3 --> 2 --> 5 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 2, 4).toString()); // head --> 1 --> 4 --> 3 --> 2 --> 5 --> null
  print(Solution().reverseBetween(ListNode(5), 1, 1).toString()); // head --> 5 --> null

  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 1, 5).toString()); // head --> 5 --> 4 --> 3 --> 2 --> 1 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3, ListNode(4)))), 1, 3).toString()); // head --> 3 --> 2 --> 1 --> 4 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 3, 5).toString()); // head --> 1 --> 2 --> 5 --> 4 --> 3 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3))), 2, 2).toString()); // head --> 1 --> 2 --> 3 --> null
  print(Solution().reverseBetween(ListNode(7), 1, 1).toString()); // head --> 7 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2)), 1, 2).toString()); // head --> 2 --> 1 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2)), 2, 2).toString()); // head --> 1 --> 2 --> null
  print(Solution().reverseBetween(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, ListNode(8, ListNode(9, ListNode(10)))))))))), 4, 8).toString()); // head --> 1 --> 2 --> 3 --> 8 --> 7 --> 6 --> 5 --> 4 --> 9 --> 10 --> null
  print(Solution().reverseBetween(null, 1, 1)); // null
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() {
    ListNode? head = this;
    String list = '';
    list += 'head --> ';
    while (head != null) {
      list += '${head.val} --> ';
      head = head.next;
    }
    list += 'null';
    return list;
  }
}

class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    if (left == right) return head;

    int i = 1;

    ListNode? current = head, previous = null;
    while (i < left) {
      previous = current;
      current = current?.next;
      i++;
    }

    final ListNode? lToRNode = previous;
    final ListNode? rToLNode = current;

    while (i <= right) {
      final ListNode? next = current?.next;
      current?.next = previous;
      previous = current;
      current = next;
      i++;
    }

    // print('LToR = ${lToRNode?.val}');
    // print('RtoL = ${rToLNode?.val}');
    // print('P->C->N = ${previous?.val} -> ${current?.val} -> ${current?.next?.val}');
    // print('P = ${previous?.val} -> ${previous?.next?.val}');

    if (lToRNode == null) {
      head = previous;
    } else {
      lToRNode.next = previous;
    }
    rToLNode?.next = current;

    return head;
  }
}

// class Solution {
//   ListNode? reverseBetween(ListNode? head, int left, int right) {
//     if (left == right) return head;
//
//     int i = 1;
//
//     ListNode? current = head, previous = null;
//     while (i++ < left) {
//       previous = current;
//       current = current?.next;
//     }
//
//     final ListNode? lToRNode = previous;
//     final ListNode? rToLNode = current;
//
//     while (i++ <= right) {
//       final ListNode? next = current?.next;
//       current?.next = previous;
//       previous = current;
//       current = next;
//     }
//
//     print('LToR = ${lToRNode?.val}');
//     print('RtoL = ${rToLNode?.val}');
//     print('P->C->N = ${previous?.val} -> ${current?.val} -> ${current?.next?.val}');
//
//     if (lToRNode == null) {
//       head = current;
//     } else {
//       lToRNode.next = current;
//     }
//     rToLNode?.next = current?.next;
//     current?.next = previous;
//
//    return head;
//   }
// }

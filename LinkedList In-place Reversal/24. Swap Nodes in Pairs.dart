
void main() {
  print(Solution().swapPairs(ListNode(1, ListNode(2, ListNode(3, ListNode(4))))).toString()); // head --> 2 --> 1 --> 4 --> 3 --> null
  print(Solution().swapPairs(null).toString()); // null
  print(Solution().swapPairs(ListNode(1)).toString());  // head --> 1 --> null
  print(Solution().swapPairs(ListNode(1, ListNode(2, ListNode(3)))).toString()); // head --> 2 --> 1 --> 3 --> null
  print(Solution().swapPairs(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))).toString()); // head --> 2 --> 1 --> 4 --> 3 --> 5 --> null
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
  ListNode? swapPairs(ListNode? head) {
    final ListNode? dummy = ListNode(0, head);

    ListNode? current = dummy;
    while (current?.next != null && current?.next?.next != null) {
      ListNode? first = current?.next;
      ListNode? second = current?.next?.next;

      first?.next = second?.next;
      second?.next = first;
      current?.next = second;

      current = current?.next?.next;
    }

    return dummy?.next;
  }
}
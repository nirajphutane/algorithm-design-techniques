
void main() {
  print(Solution().reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))).toString()); // head --> 5 --> 4 --> 3 --> 2 --> 1 --> null
  print(Solution().reverseList(ListNode(1, ListNode(2))).toString()); // head --> 2 --> 1 --> null
  print(Solution().reverseList(null).toString()); // null
  print(Solution().reverseList(ListNode(1, ListNode(2, ListNode(3)))).toString()); // head --> 3 --> 2 --> 1 --> null
  print(Solution().reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4))))).toString()); // head --> 4 --> 3 --> 2 --> 1 --> null
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
  ListNode? reverseList(ListNode? head) {

    ListNode? previous = null;
    ListNode? current = head;
    while (current!= null) {
      ListNode? next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    return previous;
  }
}
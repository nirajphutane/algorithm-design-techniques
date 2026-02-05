
void main(final List<String> args) {
  print(Solution().reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))).toString()); // [5,4,3,2,1]
  print(Solution().reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4))))).toString());  // [4,3,2,1]
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
  ListNode? reverseList(final ListNode head) {
    ListNode? current = head, previous = null, next = null;

    while (current != null) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    return previous;
  }
}
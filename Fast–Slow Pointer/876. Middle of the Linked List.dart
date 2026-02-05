
void main(final List<String> args) {
  print(Solution().middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))).toString()); // [3,4,5]
  print(Solution().middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6))))))).toString());  // [4,5,6]
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
  ListNode? middleNode(ListNode? head) {
    ListNode? slow = head, fast = head;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }
    return slow;
  }
}
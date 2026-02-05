
void main(final List<String> args) {
  ListNode child = ListNode(2);
  print(Solution().hasCycle(ListNode(3, child.next = ListNode(2, ListNode(0, ListNode(4, child)))))); // true

  child = ListNode(1);
  print(Solution().hasCycle(child.next = ListNode(2, child))); // true

  print(Solution().hasCycle(ListNode(1)));  // false
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
   bool hasCycle(final ListNode? head) {
    ListNode? slow = head, fast = head;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
      if (slow == fast) {
        return true;
      }
    }
    return false;
  }
}

void main(final List<String> args) {
  ListNode child = ListNode(2);
  print(Solution().detectCycle(ListNode(3, child.next = ListNode(2, ListNode(0, ListNode(4, child)))))?.val); // 2

  child = ListNode(1);
  print(Solution().detectCycle(child.next = ListNode(2, child))?.val); // 2

  print(Solution().detectCycle(ListNode(1))?.val);  // null
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
  ListNode? detectCycle(final ListNode head) {

    if (head.next == null) {
      return null;
    }

    ListNode? slow = head, fast = head;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;

      if (slow == fast) {
        break;
      }
    }

    if (fast == null || fast.next == null) {
      return null;
    }

    slow = head;
    while (slow != fast) {
      slow = slow?.next;
      fast = fast?.next;
    }

    return fast;
  }
}
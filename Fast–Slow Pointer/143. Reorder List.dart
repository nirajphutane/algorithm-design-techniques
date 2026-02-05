
void main(final List<String> args) {
  final list1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  Solution().reorderList(list1);  // [1,5,2,4,3]
  print(list1.toString());
  final list2 = ListNode(1, ListNode(2, ListNode(3, ListNode(4))));
  Solution().reorderList(list2);  // [1,4,2,3]
  print(list2.toString());
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
  void reorderList(ListNode? head) {
    // Find mid
    ListNode? slow = head, fast = head?.next;
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }

    ListNode? secondHalf = slow?.next;
    slow?.next = null;

    // Reverse second half
    ListNode? current = secondHalf, previous = null, next = null;
    while (current != null) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    // Merge
    ListNode? h1Next, h2Next;
    while (previous != null) {
     h1Next = head?.next;
     h2Next = previous.next;
     head?.next = previous;
     previous.next = h1Next;
     head = h1Next;
     previous = h2Next;
    }
  }
}


import 'dart:math';

void main(final List<String> args) {
  print(Solution().kSmallestPairs([1,7,11], [2,4,6], 3));  // [[1,2],[1,4],[1,6]]
  print(Solution().kSmallestPairs([1,1,2], [1,2,3], 2));  // [[1,1],[1,1]]

  print(Solution().kSmallestPairs([1],[1],1)); // [[1,1]]
  print(Solution().kSmallestPairs([1,2],[3],5)); // [[1,3],[2,3]]
  print(Solution().kSmallestPairs([1,1,1],[2,2,2],4)); // [[1,2],[1,2],[1,2],[1,2]]
  print(Solution().kSmallestPairs([-1,0,1],[-2,3],4)); // [[-1,-2],[0,-2],[1,-2],[-1,3]]
  print(Solution().kSmallestPairs([], [1,2],3)); // []
  print(Solution().kSmallestPairs([1,2,3],[4,5],0)); // []
  print(Solution().kSmallestPairs([1,2,4,5,6],[3,5,7,9],6)); // [[1,3],[2,3],[1,5],[4,3],[2,5],[5,3]]
}

class Solution {
  List<List<int>> kSmallestPairs(final List<int> nums1, final List<int> nums2, final int k) {
    final List<List<int>> result = [];
    final PriorityQueue<Pair> pq = PriorityQueue((a, b) => ((nums1[a.first] + nums2[a.last]) > (nums1[b.first] + nums2[b.last])));

    final int size = min(nums1.length, k);
    for (int i = 0; i < size && i < k; i++) {
      pq.insert(Pair(i, 0));
    }

    while (pq.size > 0 && result.length < k) {
      final Pair pair = pq.pole();
      result.add([nums1[pair.first], nums2[pair.last]]);
      if (pair.last+1 < nums2.length) {
        pq.insert(Pair(pair.first, pair.last+1));
      }
    }

    return result;
  }
}

class Pair {
  final int first, last;
  const Pair(this.first, this.last);
}

class PriorityQueue<T> {

  final List<T> _heap = [];
  int get size => _heap.length;
  final bool Function(T a, T b) comparator;

  PriorityQueue(this.comparator);

  void insert(final T value) {
    _heap.add(value);
    _upHeapify(size-1);
  }

  T pole() {
    final T value = _heap.first;
    _heap.first = _heap.last;
    _heap.removeLast();
    _downHeapify(0);
    return value;
  }

  void _upHeapify(final int child) {
    final int parent = _parent(child);
    if (comparator(_heap[parent], _heap[child])) {
      _swap(parent, child);
      _upHeapify(parent);
    }
  }

  void _downHeapify(final int parent) {
    int p = parent;
    int child = _leftChild(parent);
    if (child < size && comparator(_heap[p], _heap[child])) {
      p = child;
    }
    child = _rightChild(parent);
    if (child < size && comparator(_heap[p], _heap[child])) {
      p = child;
    }

    if (p != parent) {
      _swap(p, parent);
      _downHeapify(p);
    }
  }

  int _parent(final int child) => child ~/ 2;
  int _leftChild(final int parent) => 2 * parent + 1;
  int _rightChild(final int parent) => 2 * parent + 2;
  void _swap(final int i, final int j) {
    final T tmp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = tmp;
  }
}

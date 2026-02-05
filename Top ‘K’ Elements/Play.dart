
void main(final List<String> args) {
  print(Solution().kSmallestPairs([1,7,11], [2,4,6], 3));  // [[1,2],[1,4],[1,6]]
  print(Solution().kSmallestPairs([1,1,2], [1,2,3], 2));  // [[1,1],[1,1]]
}

class Solution {
  List<List<int>> kSmallestPairs(final List<int> nums1, final List<int> nums2, final int k) {
    final PriorityQueue<Pair> pq = PriorityQueue((a, b) => (nums1[a.first] + nums2[a.last]) > (nums1[b.first] + nums2[b.last]));

    for (int i = 0; i < nums1.length; i++) {
      pq.add(Pair(i, 0));
    }

    final List<List<int>> result = [];
    while (pq.size > 0 && result.length < k) {
      final Pair pair = pq.pole();
      result.add([nums1[pair.first], nums2[pair.last]]);
      if (pair.last+1 < nums2.length) {
        pq.add(Pair(pair.first, pair.last+1));
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
  final bool Function(T a, T b) comparator;
  int get size => _heap.length;

  PriorityQueue(this.comparator);

  void add(final T value) {
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
    final int parent = child ~/ 2;
    if (comparator(_heap[parent], _heap[child])) {
      _swap(parent, child);
      _upHeapify(parent);
    }
  }

  void _downHeapify(final int parent) {
    int p = parent;
    int child = (2*p)+1;
    if (child < size && comparator(_heap[p], _heap[child]) ) {
      p = child;
    }
    child++;
    if (child < size && comparator(_heap[p], _heap[child]) ) {
      p = child;
    }
    if (p != parent) {
      _swap(p, parent);
      _downHeapify(p);
    }
  }

  void _swap(final int i, final int j) {
    final T tmp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = tmp;
  }
}
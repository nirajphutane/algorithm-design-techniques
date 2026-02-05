
void main(final List<String> args) {
  print(Solution().findKthLargest([3,2,1,5,6,4], 2));  // 5
  print(Solution().findKthLargest([3,2,3,1,2,4,5,5,6], 4));  // 4

  print(Solution().findKthLargest([5,5,5,5], 2));  // 5
  print(Solution().findKthLargest([7,6,5,4,3,2,1], 1));  // 7
  print(Solution().findKthLargest([2,1,2,1,3], 3));  // 2
  print(Solution().findKthLargest([10,9,8,7,6,5,4,3,2,1], 5));  // 6
  print(Solution().findKthLargest([4,2,5,5,6,1,2,3], 6));  // 2
  print(Solution().findKthLargest([100,200,300,100,200,300], 2));  // 300
  print(Solution().findKthLargest([-1,-2,-3,-4,-5], 1));  // -1
  print(Solution().findKthLargest([1], 1));  // 1
  print(Solution().findKthLargest([7,6,5,4,3,2,1], 7));  // 1
  print(Solution().findKthLargest([-1,-2,-3,-4,-5], 5));  // -5
}

class Solution {
  int findKthLargest(final List<int> nums, final int k) {
    return -1;
  }

  // int findKthLargest(final List<int> nums, final int k) {
  //   final int target = nums.length-k;
  //
  //   int partitionIndex(final int low, final int high) {
  //
  //     void swap(final int i, final int j) {
  //       final int tmp = nums[i];
  //       nums[i] = nums[j];
  //       nums[j] = tmp;
  //     }
  //
  //     int partition = low;
  //     for (int i = low; i < high; i++) {
  //       if (nums[i] <= nums[high]) {
  //         swap(i, partition++);
  //       }
  //     }
  //     swap(partition, high);
  //
  //     if (target < partition) return partitionIndex(low, partition-1);
  //     if (target > partition) return partitionIndex(partition+1, high);
  //     return partition;
  //   }
  //
  //   return nums[partitionIndex(0, nums.length-1)];
  // }
}
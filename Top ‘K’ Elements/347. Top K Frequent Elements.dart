
void main(final List<String> args) {
  print(Solution().topKFrequent([1,1,1,2,2,3], 2));  // [1,2]
  print(Solution().topKFrequent([1], 1));  // [1]
  print(Solution().topKFrequent([1,2,1,2,1,2,3,1,3,2], 2));  // [1,2]

  print(Solution().topKFrequent([4,4,4,6,6,7,7,7,7,8], 3));  // [7,4,6]
  print(Solution().topKFrequent([5,5,5,5,5], 1));  // [5]
  print(Solution().topKFrequent([1,2,3,4,5,6], 3));  // [1,2,3]
  print(Solution().topKFrequent([1,1,2,2,3,3,4,4,5], 4));  // [1,2,3,4]
  print(Solution().topKFrequent([1,2,3,1,2,1,2,3,3,3], 2));  // [3,1]
  print(Solution().topKFrequent([1,2,3,4,5,6,1,2,3,4,5,6,6,6], 2));  // [6,1]
  print(Solution().topKFrequent([9,8,7,7,6,6,6,5,5,5,5], 3));  // [5,6,7]
  print(Solution().topKFrequent([1,1,2,2,3,3,4,4,5,5], 5));  // [1,2,3,4,5]
}

class Solution {

  List<int> topKFrequent(final List<int> nums, final int k) {
    final Map<int, int> frequencies = {};
    for (final int num in nums) {
      frequencies[num] = (frequencies[num]?? 0) +1;
    }

    final List<List<int>> seed = List.generate(nums.length+1, (index) => []);
    frequencies.forEach((key, value) {
      seed[value].add(key);
    });

    final List<int> result = List<int>.generate(k, (_) => -1);
    int idx = 0;
    for (int i = seed.length-1; i >= 0 && idx < k; i--) {
      for (int j = 0; j < seed[i].length && idx < k; j++) {
        result[idx++] = seed[i][j];
      }
    }

    return result;
  }

  // List<int> topKFrequent(final List<int> nums, final int k) {
  //   final Map<int, int> frequencies = {};
  //   for (int i = 0; i < nums.length; i++) {
  //     frequencies[nums[i]] = (frequencies[nums[i]]?? 0) + 1;
  //   }
  //
  //   final List<List<int>> buckets = List<List<int>>.generate(nums.length+1, (_) => []);
  //   frequencies.forEach((num, count) { buckets[count].add(num); });
  //
  //   final List<int> result = [];
  //   for (int i = buckets.length-1; i > 0 && result.length < k; i--) {
  //     for (final int n in buckets[i]) {
  //       result.add(n);
  //       if (result.length == k) break;
  //     }
  //   }
  //   return result;
  // }
}
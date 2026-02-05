
void main(final List<String> args) {
  print(Solution().subarraysDivByK([4,5,0,-2,-3,1], 5));  // 7
  print(Solution().subarraysDivByK([5], 9));  // 0
  print(Solution().subarraysDivByK([2,3,6,1,4], 3));  // 4
  print(Solution().subarraysDivByK([-1,2,9], 2)); // 2
  print(Solution().subarraysDivByK([7,7,7,7], 7));  // 10
  print(Solution().subarraysDivByK([1,-1,1,-1,1], 2));  // 6
  print(Solution().subarraysDivByK([10,-3,-7,20,-10], 10)); // 10
  print(Solution().subarraysDivByK([0,0,0], 3));  // 6
  print(Solution().subarraysDivByK([8,1,2,9], 5));  // 1
  print(Solution().subarraysDivByK([100,-50,-25,-25,1], 25)); //10
  print(Solution().subarraysDivByK([5,5,5,5,5], 5));  // 15
  print(Solution().subarraysDivByK([-5,-10,15], 5));  // 6
  print(Solution().subarraysDivByK([1,2,3,4,5,6], 7));  // 3
  print(Solution().subarraysDivByK([-2,-2,-2,-2], 4));  // 4
}

class Solution {

  int subarraysDivByK(final List<int> nums, final int k) {
    int count = 0, prefixSum = 0;
    final Map<int, int> seed = {prefixSum: 1};
    for (final int num in nums) {
      prefixSum += num;
      final int reminder = prefixSum % k;
      if (seed.containsKey(reminder)) {
        count += seed[reminder]!;
      }

      seed[reminder] = (seed[reminder]?? 0) + 1;
    }

    return count;
  }

  // int subarraysDivByK(final List<int> nums, final int k) {
  //   int count = 0, prefixSum = 0;
  //   final Map<int, int> map = {prefixSum: 1};
  //
  //   for (final int num in nums) {
  //     prefixSum += num;
  //
  //     final int reminder = prefixSum % k;
  //     // if (reminder < 0) reminder += k;  /*Note: Dart never give -ve reminder*/
  //
  //     if (map.containsKey(reminder)) {
  //       count += map[reminder]!;
  //     }
  //
  //     map[reminder] = (map[reminder]?? 0) + 1;
  //   }
  //
  //   return count;
  // }
}
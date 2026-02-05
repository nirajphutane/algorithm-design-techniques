
void main(final List<String> args) {
  NumArray array = NumArray([-2, 0, 3, -5, 2, -1]);
  print(array.sumRange(0, 2));  // 1
  print(array.sumRange(2, 5));  // -1
  print(array.sumRange(0, 5));  // -3

  array = NumArray([4, -1, 2, 7, -3, 5, -2]);
  print(array.sumRange(0, 3));  // 12
  print(array.sumRange(2, 6));  // 9
  print(array.sumRange(4, 4));  // -3

  array = NumArray([1, 2, 3, 4, 5]);
  print(array.sumRange(0, 1));  // 3
  print(array.sumRange(1, 3));  // 9
  print(array.sumRange(0, 4));  // 15

  array = NumArray([-1, -2, -3, -4]);
  print(array.sumRange(1, 2));  // -5
  print(array.sumRange(0, 3));  // -10
  print(array.sumRange(2, 3));  // -7

  array = NumArray([1000, -1000, 500, -500, 0]);
  print(array.sumRange(0, 1));  // 0
  print(array.sumRange(1, 3));  // -1000
  print(array.sumRange(0, 4));  // 0

  array = NumArray([9, -4, 2]);
  print(array.sumRange(0, 0));  // 9
  print(array.sumRange(1, 1));  // -4
  print(array.sumRange(0, 2));  // 7
}

class NumArray {

  final List<int> nums;
  late final List<int> prefixSumArray;

  NumArray(this.nums) {
    prefixSumArray = List.filled(nums.length, 0);

    prefixSumArray.first = nums.first;
    for (int i = 1; i < nums.length; i++) {
      prefixSumArray[i] = prefixSumArray[i-1] + nums[i];
    }
  }

  int sumRange(final int left, final int right) {
    if (left == 0) {
      return prefixSumArray[right];
    }
    return prefixSumArray[right] - prefixSumArray[left-1];
  }
}

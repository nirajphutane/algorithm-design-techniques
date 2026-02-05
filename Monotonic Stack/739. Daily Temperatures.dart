
void main(final List<String> args) {
  print(Solution().dailyTemperatures([73,74,75,71,69,72,76,73])); // [1,1,4,2,1,1,0,0]
  print(Solution().dailyTemperatures([30,40,50,60])); // [1,1,1,0]
  print(Solution().dailyTemperatures([30,60,90])); // [1,1,0]
}

class Solution {

  List<int> dailyTemperatures(final List<int> temperatures) {
    final List<int> result = List.filled(temperatures.length, 0);

    final List<int> monotonicStack = [];
    for (int i = temperatures.length-1; i >= 0; i--) {
      while (monotonicStack.isNotEmpty && temperatures[monotonicStack.last] <= temperatures[i]) {
        monotonicStack.removeLast();
      }

      if (monotonicStack.isNotEmpty) {
        result[i] = monotonicStack.last-i;
      }

      monotonicStack.add(i);
    }

    return result;
  }
}
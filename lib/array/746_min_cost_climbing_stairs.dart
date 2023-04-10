import 'dart:math';

void main() {
  print(minCostClimbingStairs([0, 1, 2, 2]));
  // print(minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]));
  // print(minCostClimbingStairs([10, 15, 20]));
}

int minCostClimbingStairs(List<int> cost) {
  final steps = List.filled(cost.length + 1, 0);
  for (int i = 2; i < steps.length; i++) {
    steps[i] = min(steps[i - 2] + cost[i - 1], steps[i - 1] + cost[i - 1]);
  }
  return min(steps[steps.length - 1], steps[steps.length - 2]);
}

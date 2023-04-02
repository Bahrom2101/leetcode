void main(List<String> args) {
  print(minEatingSpeed([
    332484035,
    524908576,
    855865114,
    632922376,
    222257295,
    690155293,
    112677673,
    679580077,
    337406589,
    290818316,
    877337160,
    901728858,
    679284947,
    688210097,
    692137887,
    718203285,
    629455728,
    941802184,
  ], 823855818));
}

int minEatingSpeed(List<int> piles, int h) {
  int max = 0;
  int sum = 0;
  for (var e in piles) {
    sum += e;
    if (e > max) max = e;
  }
  if (h == piles.length) return max;
  int min = (sum / h).ceil();
  while (min < max) {
    int tempHours = 0;
    for (var e in piles) {
      tempHours += (e / min).ceil();
    }
    if (tempHours <= h && tempHours > 0) {
      max = min - 1;
    } else if (tempHours > h || tempHours < 0) {
      min = min + 1;
    }
  }
  return min;
}

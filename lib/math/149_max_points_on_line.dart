import 'dart:math';

void main(List<String> args) {
  List<List<int>> points = [
    [115, -216],
    [-32, -104],
    [-40, -113],
    [39, 30],
    [-3, 39],
    [-230, 324],
    [161, -288],
    [-207, 288],
    [34, -2],
    [-22, 19],
    [-28, -134],
    [-5, 0],
    [-48, -122],
    [16, 11],
    [32, -32],
    [7, 32],
    [0, -17],
    [40, -23],
    [-161, 216],
    [-291, 141],
    [12, 42],
    [-72, -149],
    [39, 23],
    [-112, -464],
    [80, 22],
    [-6, -21],
    [873, -111]
  ];
  print(maxPoints(points));
}

int maxPoints(List<List<int>> points) {
  int max = 0;
  for (int i = 0; i < points.length - 2; i++) {
    for (int j = i + 1; j < points.length - 1; j++) {
      final x1 = points[i][0];
      final y1 = points[i][1];
      final x2 = points[j][0];
      final y2 = points[j][1];
      int inlineMax = 2;
      for (int z = j + 1; z < points.length; z++) {
        final x3 = points[z][0];
        final y3 = points[z][1];
        bool isAtSame = false;
        print('(${i + 1},${j + 1}) -> ${z + 1}');
        print('([$x1,$y1],[$x2,$y2]) -> [$x3,$y3]');
        if (x1 == x2 && x2 == x3 || y1 == y2 && y2 == y3) {
          isAtSame = true;
        } else if (x2 >= x1 && x2 <= x3 || x2 >= x3 && x2 <= x1) {
          print('condition 1');
          isAtSame = isAtSameLine(x1, y1, x2, y2, x3, y3);
        } else if (x1 <= x2 && x1 >= x3 || x1 >= x2 && x1 <= x3) {
          print('condition 2');
          isAtSame = isAtSameLine(x2, y2, x1, y1, x3, y3);
        } else {
          print('condition 3');
          isAtSame = isAtSameLine(x2, y2, x3, y3, x1, y1);
        }
        print('same line: $isAtSame');
        if (isAtSame) {
          inlineMax += 1;
        }
      }
      if (inlineMax > max) {
        max = inlineMax;
      }
    }
  }
  return max;
}

bool isAtSameLine(int x1, int y1, int x2, int y2, int x3, int y3) {
  print('$x1,$y1, $x2,$y2, $x3,$y3');
  print(pow(pow((x1 - x3), 2) + pow((y1 - y3), 2), 0.5));
  print(pow(pow((x1 - x2), 2) + pow((y1 - y2), 2), 0.5) +
      pow(pow((x2 - x3), 2) + pow((y2 - y3), 2), 0.5));
  if (pow(pow((x1 - x3), 2) + pow((y1 - y3), 2), 0.5).toStringAsFixed(10) ==
      (pow(pow((x1 - x2), 2) + pow((y1 - y2), 2), 0.5) +
              pow(pow((x2 - x3), 2) + pow((y2 - y3), 2), 0.5))
          .toStringAsFixed(10)) {
    return true;
  } else {
    return false;
  }
}

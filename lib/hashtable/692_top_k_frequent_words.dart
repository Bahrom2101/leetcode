void main() {
  // print(topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 3));
  print(topKFrequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4));
}

List<String> topKFrequent(List<String> words, int k) {
  words.sort((a,b) => a.compareTo(b));
  Map<String, int> map = {};
  for (int i = 0; i < words.length; i++) {
    map[words[i]] = (map[words[i]] ?? 0) + 1;
  }
  print(map);
  return [];
}

class Point {
  String word;
  int count;

  Point(this.word, this.count);

  @override
  String toString() {
    return 'Point{word: $word, count: $count}';
  }
}

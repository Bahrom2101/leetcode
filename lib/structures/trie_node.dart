class TrieNode<T> {
  TrieNode({this.key, this.parent});

  T? key;

  TrieNode? parent;

  Map<int, List<TrieNode>> children = {};

  bool isTerminating = false;
}

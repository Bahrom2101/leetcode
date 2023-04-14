import 'trie_node.dart';

class Trie<E, T extends Iterable<E>> {
  TrieNode<E> root = TrieNode(key: null, parent: null);

  final Set<T> _allCollections = {};

  Set<T> get allCollections => _allCollections;

  int get length => _allCollections.length;

  bool get isEmpty => _allCollections.isEmpty;

  void insert(T collection) {
    var current = root;
    for (E element in collection) {
      current.children[element] ??= TrieNode(
        key: element,
        parent: current,
      );
      current = current.children[element]!;
    }
    current.isTerminating = true;
    _allCollections.add(collection);
  }

  bool contains(T collection) {
    var current = root;
    for (var codeUnit in collection) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminating;
  }

  void remove(T collection) {
    var current = root;
    for (final codeUnit in collection) {
      final child = current.children[codeUnit];
      if (child == null) {
        return;
      }
      current = child;
    }
    if (!current.isTerminating) {
      return;
    }
    current.isTerminating = false;
    _allCollections.remove(collection);
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

}

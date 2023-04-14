import 'package:leetcode/structures/trie/trie.dart';

void main() {
  final trie = Trie<int, List<int>>();
  trie.insert('cut'.codeUnits);
  trie.insert('cute'.codeUnits);
  if (trie.contains('cute'.codeUnits)) {
    print('cute is in the trie');
  }
  trie.remove('cut'.codeUnits);
  assert(!trie.contains('cut'.codeUnits));
}

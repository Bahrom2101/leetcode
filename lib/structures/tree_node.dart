class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode? next;

  TreeNode([
    this.val = 0,
    this.left,
    this.right,
    this.next,
  ]);

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    TreeNode? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.left == null && node.right == null) {
      return '$root ${node.val}\n';
    }
    final a = _diagram(
      node.right,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.val}\n';
    final c = _diagram(
      node.left,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}

extension Serializable on TreeNode {
  void traversePreOrderWithNull(void Function(int? value) action) {
    action(val);
    if (left == null) {
      action(null);
    } else {
      left!.traversePreOrderWithNull(action);
    }
    if (right == null) {
      action(null);
    } else {
      right!.traversePreOrderWithNull(action);
    }
  }

  List<int?> serialize() {
    final list = <int?>[];
    traversePreOrderWithNull((value) => list.add(value));
    return list;
  }

  TreeNode? deserialize(List<int?> list) {
    print(list);
    if (list.isEmpty) return null;
    final value = list.removeLast();
    if (value == null) return null;
    final node = TreeNode(value);
    node.left = deserialize(list);
    node.right = deserialize(list);
    return node;
  }

  TreeNode? deserializeHelper(List<int?> list) {
    return deserialize(list.reversed.toList());
  }
}

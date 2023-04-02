class Node<T> {
  Node({required this.value, this.next});

  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  int length = 0;

  @override
  bool get isEmpty => head == null;

  void push(E value) {
    length++;
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    length++;
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    length++;
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    if (value != null) {
      length--;
    }
    return value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;
    print(current);
    while (current!.next != tail) {
      current = current.next;
      print(current);
    }
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    if (value != null) {
      length--;
    }
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    if (value != null) {
      length--;
    }
    return value;
  }

  void reverse() {
    tail = head;
    Node<E>? previous = head;
    Node<E>? current = head?.next;
    previous?.next = null;
    while (current != null) {
      Node<E>? next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    head = previous;
  }

  void removeAllOccurrence(E value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }
    var current = head?.next;
    var previous = head;
    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
    }
    tail = previous;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}

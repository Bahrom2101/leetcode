class MyHashMap {
  MyHashMap();

  final List<Pair> _map = [];

  void put(int key, int value) {
    bool isHave = false;
    for (var element in _map) {
      if (element.key == key) {
        element.value = value;
        isHave = true;
        break;
      }
    }
    if (!isHave) {
      _map.add(Pair(key, value));
    }
  }

  int get(int key) {
    for (var element in _map) {
      if (element.key == key) {
        return element.value;
      }
    }
    return -1;
  }

  void remove(int key) {
    int index = -1;
    for (int i = 0; i < _map.length; i++) {
      if (_map[i].key == key) {
        index = i;
        break;
      }
    }
    if (index > -1) {
      _map.removeAt(index);
    }
  }
}

class Pair {
  int key;
  int value;

  Pair(this.key, this.value);
}

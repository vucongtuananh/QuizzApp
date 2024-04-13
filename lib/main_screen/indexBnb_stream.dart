import 'dart:async';

import 'package:injectable/injectable.dart';

@Singleton()
class IndexBnbStream {
  int indexBnb = 0;

  final StreamController<int> _indexBnbController = StreamController<int>.broadcast();

  Stream<int> get indexBnbStream => _indexBnbController.stream;

  void chooseIndex(int index) {
    indexBnb = index;
    _indexBnbController.sink.add(indexBnb);
    print(indexBnb);
  }
}

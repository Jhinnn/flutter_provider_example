import 'dart:math';

import 'package:flutter/material.dart';

class SizeProvider extends ChangeNotifier {
  Size _size = const Size(100, 100);
  get size => _size;
  setSize(Size size) {
    _size = size;
    notifyListeners();
  }

  changeContainerSize() {
    _size = Size(Random().nextDouble() * 100, Random().nextDouble() * 100);
    notifyListeners();
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _bgColor = Colors.black;
  get bgColor => _bgColor;
  setBgColor(Color bgColor) {
    _bgColor = bgColor;
    notifyListeners();
  }

  changeBgColor() {
    _bgColor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    notifyListeners();
  }

  Color _textColor = Colors.red;
  get textColor => _textColor;
  setTextColor(Color textColor) {
    _textColor = textColor;
    notifyListeners();
  }

  changeTextColor() {
    _textColor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    notifyListeners();
  }

  Color _borderColor = Colors.black26;
  get borderColor => _borderColor;
  setBorderColor(Color borderColor) {
    _borderColor = borderColor;
    // notifyListeners();
  }

  changeBorderColor() {
    _borderColor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    notifyListeners();
  }
}

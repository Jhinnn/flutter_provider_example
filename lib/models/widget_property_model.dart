import 'package:flutter/material.dart';

class WidgetPropertyModel {
  late Color _bgColor;
  late Size _size;

  get size => _size;
  get bgColor => _bgColor;

  WidgetPropertyModel(Color bgColor, Size size) {
    _size = size;
    _bgColor = bgColor;
  }
}

import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  Map _map = {};
  get map => _map;
  setMap(Map map) {
    _map = map;
    notifyListeners();
  }
}

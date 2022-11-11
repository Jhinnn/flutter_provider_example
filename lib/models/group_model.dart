import 'package:flutter/material.dart';

class GroupModel {
  late int _groupId;
  late String _groupName;
  late Color _groupColor;
  late int _groupStatus;

  get groupId => _groupId;
  get groupName => _groupName;
  get groupColor => _groupColor;
  get groupStatus => _groupStatus;

  GroupModel(
      int groupId, String groupName, Color groupColor, int groupStatus) {
    _groupId = groupId;
    _groupName = groupName;
    _groupColor = groupColor;
    _groupStatus = groupStatus;
  }
}

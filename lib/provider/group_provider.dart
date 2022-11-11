import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/group_model.dart';

class GroupProvider extends ChangeNotifier {
  String _groupId = '';
  get groupId => _groupId;
  setGroupId(String groupId) {
    _groupId = groupId;
    notifyListeners();
  }

  Map<String, GroupModel> _groupMap = {};
  get groupMap => _groupMap;

  setGroupMap(Map<String, GroupModel> groupMap) {
    _groupMap = groupMap;
  }

  getGroup(String gourpId) {
    return _groupMap.containsKey(gourpId) ? _groupMap[gourpId] : [];
  }

  addGroupWithGroupId(String gourpId, GroupModel groupModel) {
    _groupMap[gourpId] = groupModel;
    notifyListeners();
  }

  deleteGroupWithGroupId(String gourpId) {
    if (_groupMap.containsKey(gourpId)) {
      _groupMap.remove(gourpId);
      notifyListeners();
    }
  }

  editGroupWithGroupId(String gourpId, GroupModel groupModel) {
    if (_groupMap.containsKey(gourpId)) {
      _groupMap.remove(gourpId);
      _groupMap[gourpId] = groupModel;
      notifyListeners();
    } else {}
  }
}

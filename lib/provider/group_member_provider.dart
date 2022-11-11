import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/member_model.dart';

class GroupMemberProvider extends ChangeNotifier {
  Map<String, List<MemberModel>> _memberModelMap = {};
  get memberModelMap => _memberModelMap;

  setMemberMemberListMap(Map<String, List<MemberModel>> memberModelMap) {
    _memberModelMap = memberModelMap;
  }

  

  getMemberList(String gourpId) {
    return _memberModelMap.containsKey(gourpId) ? _memberModelMap[gourpId] : [];
  }

  joinGroupWithGroupId(String gourpId, MemberModel memberModel) {
    if (_memberModelMap.containsKey(gourpId)) {
      List<MemberModel> memberList = getMemberList(gourpId);
      memberList.add(memberModel);
      notifyListeners();
    } else {}
  }

  quitGroupWithGroupId(String gourpId, MemberModel memberModel) {
    if (_memberModelMap.containsKey(gourpId)) {
      List<MemberModel> memberList = getMemberList(gourpId);
      if (memberList.contains(memberModel)) {
        memberList.remove(memberModel);
        notifyListeners();
      }
    } else {}
  }

  editGroupMemberWithGroupId(String gourpId, MemberModel memberModel) {
    if (_memberModelMap.containsKey(gourpId)) {
      List<MemberModel> memberList = getMemberList(gourpId);
      Iterable<MemberModel> memberIdList =
          memberList.where((element) => memberModel.memberId);
      if (memberIdList.contains(memberModel.memberId)) {
        memberList
            .removeWhere((element) => element.memberId == memberModel.memberId);
        memberList.add(memberModel);
        notifyListeners();
      }
    } else {}
  }
}

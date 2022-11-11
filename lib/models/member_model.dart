import 'package:flutter/material.dart';

class MemberModel {
  late String _memberId;
  late String _memberName;
  late Color _memberColor;
  late String _memberStatus;
  late String _memberIndentity;

  get memberId => _memberId;
  get memberName => _memberName;
  get memberColor => _memberColor;
  get memberStatus => _memberStatus;
  get memberIndentity => _memberIndentity;

  MemberModel(String memberId, String memberName, Color memberColor,
      String memberStatus, String memberIndentity) {
    _memberId = memberId;
    _memberName = memberName;
    _memberColor = memberColor;
    _memberStatus = memberStatus;
    _memberIndentity = memberIndentity;
  }
}

class GroupMemberList {
  List<MemberModel> _memberlist = [];
  get memberlist => _memberlist;
  GroupMemberList(List<MemberModel> memberlist) {
    _memberlist = memberlist;
  }
}

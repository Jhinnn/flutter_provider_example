import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_example/config/colors.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/provider/color_provider.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:flutter_provider_example/provider/size_provider.dart';
import 'package:provider/provider.dart';

class PEMethod {
  static changeBgColor(BuildContext context) {
    ColorProvider colorProvider =
        Provider.of<ColorProvider>(context, listen: false);
    colorProvider.changeBgColor();

  }

  static changeTextColor(BuildContext context) {
    ColorProvider colorProvider =
        Provider.of<ColorProvider>(context, listen: false);
    colorProvider.changeTextColor();
    
  }

  static changeBorderColor(BuildContext context) {
    ColorProvider colorProvider =
        Provider.of<ColorProvider>(context, listen: false);
    colorProvider.changeBorderColor();
    
  }

  static changeSize(BuildContext context) {
    SizeProvider sizeProvider =
        Provider.of<SizeProvider>(context, listen: false);
    sizeProvider.changeContainerSize();
    
  }

  static deleteGroup(BuildContext context) {
    GroupProvider groupProvider =
        Provider.of<GroupProvider>(context, listen: false);
    Map<String, GroupModel> groupMap = groupProvider.groupMap;
    var groupList = groupMap.values.map((e) => e.groupId).toList();
    if (groupList.isNotEmpty) {
      int index = Random().nextInt(groupList.length);
      String groupId = groupList[index].toString();
      context.read<GroupProvider>().deleteGroupWithGroupId(groupId);
    }
  }

  static createGroup(BuildContext context) {
    int groupId = Random().nextInt(1000);
    int colorIndex = Random().nextInt(colorList.length);
    int status = Random().nextInt(4);
    int index = Random().nextInt(10);
    GroupModel groupModel =
        GroupModel(groupId, '组织$index', colorList[colorIndex], status);
    context
        .read<GroupProvider>()
        .addGroupWithGroupId(groupId.toString(), groupModel);
  }

  static editGroup(BuildContext context) {
    GroupProvider groupProvider =
        Provider.of<GroupProvider>(context, listen: false);

    Map<String, GroupModel> groupMap = groupProvider.groupMap;
    var groupList = groupMap.values.map((e) => e.groupId).toList();
    int groupIndex = Random().nextInt(groupList.length);
    int groupId = groupList[groupIndex];

    GroupModel groupModel = GroupModel(groupId, '改变了', Colors.pink, 1);
    context
        .read<GroupProvider>()
        .editGroupWithGroupId(groupId.toString(), groupModel);
  }
}

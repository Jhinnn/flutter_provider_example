
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:provider/provider.dart';

class GroupWidget extends StatelessWidget {
  final GroupModel groupModel;
  const GroupWidget({Key? key, required this.groupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>context.read<GroupProvider>().setGroupId(groupModel.groupId.toString()),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            border: Border.all(width: 5, color: groupModel.groupColor)),
        child: Center(
            child: Text(
          groupModel.groupName,
          style: const TextStyle(fontSize: 12),
        )),
      ),
    );
  }
}
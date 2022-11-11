import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/widgets/group_widget.dart';

class GroupListWidget extends StatelessWidget {
  final Map<String, GroupModel> groupMap;
  const GroupListWidget({Key? key, required this.groupMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: groupMap.values
                .map((e) => GroupWidget(
                      groupModel: e,
                    ))
                .toList(),
          ),
        ));
  }
}

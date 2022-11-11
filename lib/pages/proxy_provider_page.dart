import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/config/colors.dart';
import 'package:flutter_provider_example/config/common_methods.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/models/member_model.dart';
import 'package:flutter_provider_example/models/widget_property_model.dart';
import 'package:flutter_provider_example/provider/color_provider.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:flutter_provider_example/provider/size_provider.dart';
import 'package:flutter_provider_example/widgets/color_widget.dart';
import 'package:flutter_provider_example/widgets/group_list_widget.dart';
import 'package:flutter_provider_example/widgets/group_widget.dart';
import 'package:flutter_provider_example/widgets/handle_widget.dart';
import 'package:provider/provider.dart';

class ProxyProviderPage extends StatefulWidget {
  const ProxyProviderPage({Key? key}) : super(key: key);

  @override
  State<ProxyProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProxyProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('ProxyProviderPage build');
    return Scaffold(
      appBar: AppBar(title: const Text('ProxyProvider')),
      body: Row(
        children: [
          Selector<GroupProvider, Map<String, GroupModel>>(
              selector: (context, itemChange) => itemChange.groupMap,
              shouldRebuild: (pre, next) => true,
              builder: (context, data, child) {
                print('ProxyProviderPage GroupProvider Selector build');
                Map<String, GroupModel> groupMap = data;
                return GroupListWidget(groupMap: groupMap);
              }),
          Consumer<GroupMemberList>(builder: (context, value, child) {
            print('ProxyProviderPage ProxyProivder Consumer build');
            return SingleChildScrollView(
              child: Column(
                  children: value.memberlist
                      .map<Widget>((MemberModel e) => Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: e.memberColor,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                e.memberName,
                              ),
                            ],
                          ))
                      .toList()),
            );
          })
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ProxyProviderPage didChangeDependencies');
  }
}

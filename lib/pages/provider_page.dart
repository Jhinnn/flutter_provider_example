import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/config/colors.dart';
import 'package:flutter_provider_example/config/common_methods.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:flutter_provider_example/widgets/group_widget.dart';
import 'package:flutter_provider_example/widgets/handle_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/group_list_widget.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('ProviderPage build');
    GroupProvider groupProvider =
        Provider.of<GroupProvider>(context, listen: true);
    Map<String, GroupModel> groupMap = groupProvider.groupMap;

    return Scaffold(
      appBar: AppBar(title: const Text('provider')),
      body: Row(
        children: [
          GroupListWidget(groupMap: groupMap),
          const GroupHandleWidget(),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ProviderPage didChangeDependencies');
  }

  @override
  void dispose() {
    // TODO: implement dispose

    print('ProviderPage dispose');

    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate

    print('ProviderPage deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(covariant ProviderPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print('ProviderPage didUpdateWidget');
  }
}

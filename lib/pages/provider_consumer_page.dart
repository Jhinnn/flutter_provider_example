import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/config/colors.dart';
import 'package:flutter_provider_example/config/common_methods.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/provider/color_provider.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:flutter_provider_example/widgets/color_widget.dart';
import 'package:flutter_provider_example/widgets/group_list_widget.dart';
import 'package:flutter_provider_example/widgets/group_widget.dart';
import 'package:flutter_provider_example/widgets/handle_widget.dart';
import 'package:provider/provider.dart';

class ProviderConsumerPage extends StatefulWidget {
  const ProviderConsumerPage({Key? key}) : super(key: key);

  @override
  State<ProviderConsumerPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderConsumerPage> {
  @override
  Widget build(BuildContext context) {
    print('ProviderConsumerPage build');
    return Scaffold(
      appBar: AppBar(title: const Text('provider consumer')),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Consumer<GroupProvider>(
                  builder: (context, ref, child) {
                    print('ProviderConsumerPage GroupProvider Consumer builder');
                    Map<String, GroupModel> groupMap = ref.groupMap;
                    return GroupListWidget(groupMap: groupMap);
                  },
                ),
                const GroupHandleWidget(),
              ],
            ),
          ),
          const    VerticalDivider(width: 1,color: Colors.black,),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<ColorProvider>(builder: (context, value, child) {
                  print('ProviderConsumerPage ColorProvider Consumer builder');
                  return ColorWidget(
                    textColor: value.textColor,
                    
                  );
                }),
                const ContainerHandleWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ProviderConsumerPage didChangeDependencies');
  }

  @override
  void dispose() {
    // TODO: implement dispose

    print('ProviderConsumerPage dispose');

    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate

    print('ProviderConsumerPage deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(covariant ProviderConsumerPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print('ProviderConsumerPage didUpdateWidget');
  }
}

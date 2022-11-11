import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/config/colors.dart';
import 'package:flutter_provider_example/config/common_methods.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/models/widget_property_model.dart';
import 'package:flutter_provider_example/provider/color_provider.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:flutter_provider_example/provider/size_provider.dart';
import 'package:flutter_provider_example/widgets/color_widget.dart';
import 'package:flutter_provider_example/widgets/group_list_widget.dart';
import 'package:flutter_provider_example/widgets/group_widget.dart';
import 'package:flutter_provider_example/widgets/handle_widget.dart';
import 'package:provider/provider.dart';

class ProviderSelectorPage extends StatefulWidget {
  const ProviderSelectorPage({Key? key}) : super(key: key);

  @override
  State<ProviderSelectorPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderSelectorPage> {
  @override
  Widget build(BuildContext context) {
    print('ProviderSelectorPage build');
    return Scaffold(
      appBar: AppBar(title: const Text('provider selector')),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Selector<GroupProvider, Map<String, GroupModel>>(
                    selector: (context, itemChange) => itemChange.groupMap,
                    shouldRebuild: (pre, next) => true,
                    builder: (context, data, child) {
                      print(
                          'ProviderSelectorPage GroupProvider Selector build');
                      Map<String, GroupModel> groupMap = data;
                      return GroupListWidget(groupMap: groupMap);
                    }),
                const GroupHandleWidget(),
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
            color: Colors.black,
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Selector<ColorProvider, List<Color>>(
                    selector: (context, color) =>
                        [color.textColor, color.bgColor],
                    shouldRebuild: (pre, next) => pre != next,
                    builder: (context, value, child) {
                      print(
                          'ProviderSelectorPage ColorProvider Selector build');
                      return ColorWidget(
                        textColor: value.first,
                        bgColor: value.last,
                      );
                    }),
                const SizedBox(
                  width: 10,
                ),
                Selector2<ColorProvider, SizeProvider, WidgetPropertyModel>(
                    builder: (context, value, child) {
                      print(
                          'ProviderSelectorPage ColorProvider Selector2 build');
                      return Container(
                        width: value.size.width,
                        height: value.size.height,
                        color: value.bgColor,
                      );
                    },
                    shouldRebuild: (previous, next) =>
                        previous.size != next.size ||
                        previous.bgColor != next.bgColor,
                    selector: (p0, p1, p2) {
                      return WidgetPropertyModel(p1.bgColor, p2.size);
                    }),
                const ContainerHandleWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ProviderSelectorPage didChangeDependencies');
  }
}

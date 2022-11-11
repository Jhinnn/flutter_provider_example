import 'package:flutter/material.dart';
import 'package:flutter_provider_example/config/common_methods.dart';

class GroupHandleWidget extends StatelessWidget {
  const GroupHandleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => PEMethod.deleteGroup(context),
            child: const Text('删除一个组织')),
        TextButton(
            onPressed: () => PEMethod.createGroup(context),
            child: const Text('添加一个组织')),
        TextButton(
            onPressed: () => PEMethod.editGroup(context),
            child: const Text('修改一个组织')),
     
      ],
    );
  }
}


class ContainerHandleWidget extends StatelessWidget {
  const ContainerHandleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        TextButton(
            onPressed: () => PEMethod.changeBgColor(context),
            child: const Text('修改背景色')),
        TextButton(
            onPressed: () =>
                PEMethod.changeTextColor(context),
            child: const Text('修改文字颜色')),
        TextButton(
            onPressed: () =>
                PEMethod.changeBorderColor(context),
            child: const Text('修改边框颜色')),
            TextButton(
            onPressed: () =>
                PEMethod.changeSize(context),
            child: const Text('修改组件大小')),
      ],
    );
  }
}

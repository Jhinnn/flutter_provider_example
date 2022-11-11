import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureStreamProviderPage extends StatefulWidget {
  const FutureStreamProviderPage({Key? key}) : super(key: key);

  @override
  State<FutureStreamProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<FutureStreamProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('FutureStreamProviderPage build');
    return Scaffold(
        appBar: AppBar(title: const Text('provider selector')),
        body: Center(
            child: Column(
          children: [
            FutureProvider(
              create: (context) {
                print('FutureStreamProviderPage FutureProvider');
                return Future.delayed(
                    const Duration(seconds: 2),
                    () => '1234 '
                        'North Commercial Ave.');
              },
              initialData: '数据正在初始化...',
              child:
                  Builder(builder: (context) => Text(context.watch<String>())),
            ),
            StreamProvider(
                create: (context) {
                  return Stream.periodic(const Duration(seconds: 2),
                      (value) => Random().nextInt(1000000)).take(10);
                },
                initialData: 000000000,
                child: Builder(builder: (context) {
                  print('FutureStreamProviderPage StreamProvider');
                  return Text(context.watch<int>().toString());
                }))
          ],
        )));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('FutureStreamProviderPage didChangeDependencies');
  }
}

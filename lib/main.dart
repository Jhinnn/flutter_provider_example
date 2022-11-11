import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/cart.dart';
import 'package:flutter_provider_example/models/catalog.dart';
import 'package:flutter_provider_example/models/group_model.dart';
import 'package:flutter_provider_example/models/member_model.dart';
import 'package:flutter_provider_example/pages/catalog.dart';
import 'package:flutter_provider_example/pages/future_stream_provider_page.dart';
import 'package:flutter_provider_example/pages/provider_consumer_page.dart';
import 'package:flutter_provider_example/pages/provider_page.dart';
import 'package:flutter_provider_example/pages/provider_selector_page.dart';
import 'package:flutter_provider_example/pages/proxy_provider_page.dart';
import 'package:flutter_provider_example/provider/color_provider.dart';
import 'package:flutter_provider_example/provider/group_member_provider.dart';
import 'package:flutter_provider_example/provider/group_provider.dart';
import 'package:flutter_provider_example/provider/map_provider.dart';
import 'package:flutter_provider_example/provider/size_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'config/colors.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ColorProvider()),
      ChangeNotifierProvider(create: (_) => MapProvider()),
      ChangeNotifierProvider(create: (_) => SizeProvider()),
      ChangeNotifierProvider(create: (_) => GroupProvider()),
      ChangeNotifierProvider(create: (_) => GroupMemberProvider()),
      ProxyProvider2<GroupProvider, GroupMemberProvider, GroupMemberList>(
          update: (context, value, value2, previous) {
        Map map = value2.memberModelMap;

        return map.containsKey(value.groupId)
            ? GroupMemberList(value2.memberModelMap[value.groupId])
            : GroupMemberList([]);
      }),
      Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
    ],
    child: const GetMaterialApp(
      home: MyApp(),
      // initialRoute: RouteConfig.provider,
      // getPages: RouteConfig.getPages,
    ),
  ));
}

// class RouteConfig {
//   static const String provider = "/provider";
//   static const String testTwo = "/testOne/testTwo";

//   static final List<GetPage> getPages = [
//     GetPage(
//       name: provider,
//       page: () => const ProviderPage(),
//     ),
//   ];
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Provider Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget(
                voidCallback: () {
                  Get.to(const ProviderPage());
                },
                title: 'provider'),
            MyWidget(
                voidCallback: () {
                  Get.to(const ProviderConsumerPage());
                },
                title: 'provider consumer'),
            MyWidget(
                voidCallback: () {
                  Get.to(const ProviderSelectorPage());
                },
                title: 'provider selector'),
            MyWidget(
                voidCallback: () {
                  Get.to(const ProxyProviderPage());
                },
                title: 'proxy provider'),
            MyWidget(
                voidCallback: () {
                  Get.to(const FutureStreamProviderPage());
                },
                title: 'future provider'),
            MyWidget(
                voidCallback: () {
                  Get.to(const MyCatalog());
                },
                title: 'changeNotifierProxy provider'),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void initData() {
    Map<String, GroupModel> groupModelMap = {};
    Map<String, List<MemberModel>> memberModelMap = {};

    for (var i = 0; i < 10; i++) {
      List<MemberModel> memberList = [];
      int groupId = Random().nextInt(1000);
      int colorIndex = Random().nextInt(colorList.length);
      int status = Random().nextInt(4);
      GroupModel groupModel =
          GroupModel(groupId, '组织$i', colorList[colorIndex], status);
      for (var j = 0; j < 10; j++) {
        MemberModel memberModel = MemberModel(
            Random().nextInt(10000).toString(),
            '用户${Random().nextInt(1000000).toString()}',
            colorList[colorIndex],
            status.toString(),
            '0');
        memberList.add(memberModel);
      }

      memberModelMap[groupId.toString()] = memberList;
      groupModelMap[groupId.toString()] = groupModel;
    }
    context.read<GroupProvider>().setGroupMap(groupModelMap);
    context.read<GroupMemberProvider>().setMemberMemberListMap(memberModelMap);
  }
}

class MyWidget extends StatelessWidget {
  final VoidCallback voidCallback;
  final String title;
  const MyWidget({super.key, required this.voidCallback, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => voidCallback(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(title),
        ),
      ),
    );
  }
}

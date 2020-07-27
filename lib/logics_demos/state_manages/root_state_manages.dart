import 'package:flutter/material.dart';
import 'package:flutterDemos/logics_demos/state_manages/provider01.dart';
import 'package:flutterDemos/logics_demos/state_manages/provider02.dart';
import 'package:flutterDemos/logics_demos/state_manages/provider03.dart';
import 'package:flutterDemos/logics_demos/state_manages/provider04.dart';
import 'package:flutterDemos/logics_demos/state_manages/value_banding.dart';

import 'inherited_demo.dart';
import 'my_notification.dart';

class RootStateDemos extends StatelessWidget {
  final List<String> demosTitles = [
    "数据共享 InheritedWidget",
    "事件通知(不是状态管理) NotificationListener",
    "局部刷新的第二种方式",
    "局部页面的provider",
    "全局的provider",
    "Provider进阶",
    "Provider基础",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("状态管理")));
  }

  Widget createList() {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              listTapedIndex(ctx, index);
            },
            child: ListTile(
              title: Text(demosTitles[index]),
              trailing: Icon(Icons.arrow_right),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: demosTitles.length);
  }

  void listTapedIndex(ctx, index) {
    if (index == 0) {
      var page = InheritedTestPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 1) {
      var page = NotiInheritedTestPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 2) {
      var page = ValueBandingTestPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 3) {
      var page = HomePage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 4) {
      var page = ThemeColorChangeDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 5) {
      var page = ProviderAdvanced();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 6) {
      var page = PrividerBaseDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

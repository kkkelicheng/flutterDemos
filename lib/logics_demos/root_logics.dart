import 'package:flutter/material.dart';
import 'package:flutterDemos/logics_demos/state_manages/root_state_manages.dart';

import 'data_persist/root_data_persist.dart';
import 'dio_demos/dio_test.dart';
import 'languages/lang_page1.dart';
import 'platform_service/root_platform_service.dart';

class LogicsDemos extends StatelessWidget {
  final List<String> demosTitles = [
    "数据持久化",
    "状态管理",
    "国际化",
    "dio",
    "platform功能"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("LogicsDemos")));
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
      var page = RootDataDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = RootStateDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      var page = LangTestPage1();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 3) {
      var page = DioTestPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 4) {
      var page = RootPlatformDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}


import 'package:flutter/material.dart';
import 'package:flutterDemos/logics_demos/data_persist/sqlite_demo.dart';
import 'package:flutterDemos/logics_demos/data_persist/user_default.dart';

import 'file_demos.dart';

class RootDataDemos extends StatelessWidget {
  final List<String> demosTitles = ["截图写入某路径","数据持久化 plist","数据持久化 db"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("数据持久化")));
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
      var page = HandleFilePathPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = UserDefaultDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      var page = SqDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

  }
}


import 'package:flutter/material.dart';

import 'file_demos.dart';

class LogicsDemos extends StatelessWidget {
  final List<String> demosTitles = ["截图写入某路径",];

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
      var page = HandleFilePathPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

  }
}

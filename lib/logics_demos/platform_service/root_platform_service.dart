
import 'package:flutter/material.dart';

import 'image_pick_demo.dart';

class RootPlatformDemos extends StatelessWidget {
  final List<String> demosTitles = ["访问相册"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("自身平台服务")));
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
      var page = ImagePickerDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

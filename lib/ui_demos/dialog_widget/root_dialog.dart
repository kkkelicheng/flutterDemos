import 'package:flutter/material.dart';

import 'dialog_base_demo.dart';
import 'dialog_list.dart';
import 'dialog_bottom_modal.dart';

class RootsDialogWidgets extends StatelessWidget {
  final List<String> demosTitles = [
    "基本对话框",
    "ListView自定义《简单》对话框",
    "真自定义对话框",
    "底部模态对话框 & bottomSheet",
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("生命周期demos")));
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
      var page = DialogText();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 1) {
      var page = ListDialogDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 2) {
      var page = ListDialogDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 3) {
      var page = MyBottomSheet();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

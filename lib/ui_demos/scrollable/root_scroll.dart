import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/scrollable/single_child_sv.dart';
import 'package:flutterDemos/ui_demos/scrollable/wheel_scroll.dart';

import 'Expansio_panel.dart';
import 'expansion_tile.dart';

class ScrollableDemos extends StatelessWidget {
  final List<String> demosTitles = [
    "ExpansionTile 折叠菜单",
    "ExpansionPanelList 可展开列表",
    "ListWheelScrollView 滚筒效果",
    "单子元素滚动包裹"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("可滑动demos")));
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
      var page = ExpansionTileDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = ExpansionPanelDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      var page = ListWheelSVDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 3) {
      var page = SingleChildSVDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

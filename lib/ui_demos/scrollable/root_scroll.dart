import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/scrollable/single_child_sv.dart';
import 'package:flutterDemos/ui_demos/scrollable/stagger_grid.dart';
import 'package:flutterDemos/ui_demos/scrollable/wheel_scroll.dart';

import 'custom_sv.dart';
import 'grid_view.dart';
import 'list_in_cell.dart';
import 'list_view.dart';
import 'pullrefresh_demo.dart';

class ScrollableDemos extends StatelessWidget {
  final List<String> demosTitles = [
    "ListWheelScrollView 滚筒效果",
    "单子元素滚动包裹",
    "单滚动模型 listView",
    "单滚动模型 gradView",
    "pageView 可以看widgets",
    "多滚动模型 CustomScrollView",
    "交错网格",
    "pull refresh demo",
    "cell中套list",
    "cell中套List2"
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
      var page = ListWheelSVDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = SingleChildSVDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      var page = ListViewDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 3) {
      var page = GridViewDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 4) {
      var page = CustomSVDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 5) {
      // var page = StaggerGridViewDemo();
      // Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 6) {
      var page = StaggerGridViewDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 7) {
      var page = PullRefreshDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 8) {
      var page = ListInCell();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 9) {
      var page = ConfirmOrderPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

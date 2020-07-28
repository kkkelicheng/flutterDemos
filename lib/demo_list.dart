import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/ui_list.dart';

import 'dart_lang/dart_singleton.dart';
import 'logics_demos/root_logics.dart';

class DemoList extends StatelessWidget {
  final List<String> demosTitles = ["UI_s", "Logic", "Interaction","dart_lang"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("DemoList")));
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
      Navigator.of(ctx).push(
        MaterialPageRoute(
            builder: (context) => UIList(), settings: UIList.routeSettings),
      );
    }

    if (index == 1) {
      // LogicsDemos
      var page = LogicsDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      // LogicsDemos
      // var page = LogicsDemos();
      // Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 3) {
      // LogicsDemos
      var page = SingletonDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

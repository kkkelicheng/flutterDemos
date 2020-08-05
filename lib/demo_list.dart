import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/ui_list.dart';

import 'dart_lang/dart_singleton.dart';
import 'example_pages/root_pages.dart';
import 'logics_demos/languages/demo_localizations.dart';
import 'logics_demos/languages/lang_page1.dart';
import 'logics_demos/root_logics.dart';
import 'package:provider/provider.dart';

class DemoList extends StatelessWidget {
  final List<String> demosTitles = ["UI_s", "Logic", "电商pages", "dart_lang"];

  @override
  Widget build(BuildContext context) {
    // var langProvider = context.watch<LangProvider>();
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text(DemoLocalizations.of(context).taskTitle)));
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
      var page = DSDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 3) {
      // LogicsDemos
      var page = SingletonDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

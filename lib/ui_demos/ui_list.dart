import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/animations/root_animations.dart';
import 'package:flutterDemos/ui_demos/router_examples/first_page.dart';
import 'package:flutterDemos/ui_demos/router_examples/fluro_wrap.dart';
import 'package:flutterDemos/ui_demos/scrollable/root_scroll.dart';
import 'package:flutterDemos/ui_demos/widgets/roots_widgets.dart';

import 'dialog_widget/root_dialog.dart';
import 'filers_ui/root_filter.dart';
import 'layout_widgt/layout_list.dart';
import 'life_cycles/root_life_cycle.dart';

class UIList extends StatelessWidget {
  final List<String> demosTitles = [
    "生命周期",
    "路由",
    "LayoutList",
    "组件Widgets",
    "可滑动",
    "对话框",
    "动画",
    "Fluro 无参数",
    "Fluro 有参数",
    "筛选Widgets",
  ];
  static const routeName = "UIList";
  static final routeSettings = RouteSettings(name: UIList.routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("UIList")));
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
      var page = RootsLifeWidgets();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = FirstPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 2) {
      var page = LayoutList();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 3) {
      var page = RootsWidgets();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 4) {
      var page = ScrollableDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 5) {
      var page = RootsDialogWidgets();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 6) {
      var page = RootAnitmations();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 7) {
      MyFluro().navigateFromBottom(ctx, MyFluro.fluro_demo1);
    }
    if (index == 8) {
      MyFluro().navigateFromBottom(ctx, MyFluro.fluro_demo2, "?id=100");
    }
    if (index == 9) {
      var page = FilterViewDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

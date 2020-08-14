import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/widgets/page_feature.dart';
import 'package:flutterDemos/ui_demos/widgets/pager.dart';
import 'package:flutterDemos/ui_demos/widgets/scale_size_label.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pageViews.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_views.dart';
import 'package:flutterDemos/ui_demos/widgets/textField_demo.dart';

import 'Expansio_panel.dart';
import 'bottom_navigate_views.dart';
import 'custom_appBar.dart';
import 'custom_appBar2.dart';
import 'expansion_tile.dart';
import 'label_marquee.dart';
import 'load_Image_demo.dart';
import 'login_page.dart';

class RootsWidgets extends StatelessWidget {
  final List<String> demosTitles = [
    "tab_tabBarViews", //0
    "tab_PageView",
    "加载图片资源",
    "textField",
    "TabController", //4
    "深入Scaffold",
    "登录页的例子",
    "ExpansionTile 折叠菜单",
    "ExpansionPanelList 可展开列表",
    "Pager", //9
    "跑马灯Label", //10
    "自定义AppBar",
    "自定义AppBar改良版",
    "自动缩小label",
  ];

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
      var page = TabViewPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = TabPageView();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      var page = ImageAssetDemoPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 3) {
      var page = TextFieldDemos();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 4) {
      var page = BottomNaviPages();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 5) {
      var page = DeepLearnPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 6) {
      var page = LoginPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 7) {
      var page = ExpansionTileDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 8) {
      var page = ExpansionPanelDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 9) {
      var page = FLutterPagerDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 10) {
      var page = MarqueeLabelDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 11) {
      var page = MyAppBarPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 12) {
      var page = GoodAppBarPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 13) {
      var page = ScaleSizeLabelDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

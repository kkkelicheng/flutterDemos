import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab1_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab2_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab3_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab4_page.dart';

class TabViewPage extends StatefulWidget {
  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabPages = [
    Tab1Page(),
    Tab2Page(),
    Tab3Page(),
    Tab4Page(),
  ];

  final List<Tab> _tabItems = [
    Tab(text: "西岳华山", icon: Icon(Icons.ac_unit)),
    Tab(text: "中岳嵩山", icon: Icon(Icons.backup)),
    Tab(text: "南岳衡山", icon: Icon(Icons.cached)),
    Tab(text: "东岳泰山", icon: Icon(Icons.dashboard)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.length, vsync: this);
  }

  Widget createTabViews() {
    return TabBarView(
      children: _tabPages,
      controller: _tabController,
    );
  }

  /*
  一般的结构如下面
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NaviPages"),
          bottom: TabBar(
            tabs: tabs,
            controller: _controller,
            onTap: (index) {
              print("tab index : $index");
            },
          ),
        ),
        body: TabBarView(
          children: _tabPages,
          controller: _controller,
        ));
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tab views")),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.red,
              child: TabBar(tabs: _tabItems, controller: _tabController),
            ),
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.white,
              child: createTabViews(),
            )
          ],
        ),
      ),
    );
  }
}

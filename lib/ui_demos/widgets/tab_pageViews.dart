
import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab1_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab2_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab3_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab4_page.dart';

class TabPageView extends StatefulWidget {
  @override
  _TabPageViewState createState() => _TabPageViewState();
}

//PageView跟ListView是同一个家族的，所以有相似的构造方法。
//PageView中的Page是lazy根据index创建的，跟TabView不一样
//
class _TabPageViewState extends State<TabPageView>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabPages = [
    Tab1Page(),
    Tab2Page(),
    Tab3Page(),
    Tab4Page(),
  ];

  final List<Tab> tabs = [
    Tab(text: "西岳华山", icon: Icon(Icons.ac_unit)),
    Tab(text: "中岳嵩山", icon: Icon(Icons.backup)),
    Tab(text: "南岳衡山", icon: Icon(Icons.cached)),
    Tab(text: "东岳泰山", icon: Icon(Icons.dashboard)),
  ];

//有一个叫DefaultTabController的，但是一般是自己创建，这样可以手动设置TabController的index
//Tab 和 TabBarView 一定要有一个公共的controller
//为了连动，TabController 和 PageController 都需要进行控制
  TabController _tabController;
  PageController _pageController;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabPages.length, vsync: this);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NaviPages"),
          bottom: TabBar(
            tabs: tabs,
            controller: _tabController,
            onTap: (index) {
              print("tab index : $index");
              _pageController.jumpToPage(index);
            },
          ),
        ),
        body: _bodyBuild());
  }

  Widget _bodyBuild() {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          _tabController.index = index;
        },
        itemBuilder: (_, index) {
          //这里偷懒了，这里一般不会这么做的，都是动态的去创建page，根据index区分。
          return _tabPages[index];
        });
  }
}

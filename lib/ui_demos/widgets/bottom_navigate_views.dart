import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab1_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab2_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab3_page.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_pages/tab4_page.dart';

class BottomNaviPages extends StatefulWidget {
  @override
  _BottomNaviPagesState createState() => _BottomNaviPagesState();
}

class _BottomNaviPagesState extends State<BottomNaviPages> {
  final List<Widget> _tabPages = [
    Tab1Page(),
    Tab2Page(),
    Tab3Page(),
    Tab4Page(),
  ];

  final List<BottomNavigationBarItem> bottomBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("home"),
        activeIcon: Icon(Icons.access_time)),
    BottomNavigationBarItem(
        icon: Icon(Icons.cached),
        title: Text("cached"),
        backgroundColor: Colors.blue),
    BottomNavigationBarItem(icon: Icon(Icons.cake), title: Text("cake")),
    BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard), title: Text("gift")),
  ];

  Widget _buildPage(int index) {
    return _tabPages[index];
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NaviPages")),
      body: _buildPage(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 13,
          selectedItemColor: Colors.cyan,
          ////<4 的时候会是fixed， >= 4 shifting会没显示
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: this.bottomBarItems),
    );
  }
}

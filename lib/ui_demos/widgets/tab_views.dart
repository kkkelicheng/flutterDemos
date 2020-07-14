import 'package:flutter/material.dart';

class TabViewPage extends StatefulWidget {
  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> with SingleTickerProviderStateMixin{

  final List<Tab> tabItems = [
    Tab(text:"Page A"),
    Tab(text:"Page B"),
    Tab(text:"Page C"),
    Tab(text:"Page D"),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabItems.length,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("tab views")
      ),
      body: Container(
        color: Colors.green,
        child: Container(
          width:double.infinity,
          height: 40,
          child: TabBar(tabs: tabItems,controller: _tabController),
        ),
      ),
    );
  }
}
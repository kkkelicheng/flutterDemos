import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggerGridViewDemo extends StatefulWidget {
  @override
  _StaggerGridViewDemoState createState() => _StaggerGridViewDemoState();
}

class _StaggerGridViewDemoState extends State<StaggerGridViewDemo> {
  @override
  final titles = [
    "_StaggerGridViewDemoState_StaggerGridViewDemoState_StaggerGridViewDemoState",
    "dadadad1234567890",
    "A StaggeredGridView needs \nto \n know how to display each tile, and what widget is associated with a tile."
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("交错网格demo")),
      body: _createStaggerView2(),
    );
  }

  ///
  ///主轴MainAxis 方向是向下的
  ///crossAxisCount 是将屏幕划分为几个列
  ///StaggeredTile 中的 crossAxisCellCount就是占几个列
  ///一般的自适应就是用StaggeredTile.fit 
  ///
  ///

  Widget _createStaggerView() {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => new Container(
          color: Colors.green,
          child: SizedBox(
            height: 50 * (index % 3 + 1).toDouble(),
            child: new Center(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('$index'),
              ),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          // new StaggeredTile.count(2, index.isEven ? 2 : 1),
          new StaggeredTile.fit(2), //这个是自适应
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  Widget _createStaggerView2() {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) =>
          new Container(color: Colors.green, child: Text(titles[index % 3])),
      staggeredTileBuilder: (int index) =>
          // new StaggeredTile.count(2, index.isEven ? 2 : 1), //这个是固定的
          new StaggeredTile.fit(2), //这个是自适应
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

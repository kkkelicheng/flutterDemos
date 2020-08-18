import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SingleChildSVDemo extends StatefulWidget {
  @override
  _SingleChildSVDemoState createState() => _SingleChildSVDemoState();
}

class _SingleChildSVDemoState extends State<SingleChildSVDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("单个子元素的滚动包裹")),
        body: Container(
          margin: EdgeInsets.only(top: 100),
          color: Colors.grey[200],
          child: NotificationListener(
            onNotification: (Notification notification) {
              if (notification is ScrollNotification) {
                _onScrollNotifation(notification);
              }
              return true;
            },
            child: Container(
              height: 200, //200
              width: double.infinity,
              child: GestureDetector(
                onTapUp: (details) => print("onTapUp"),
                onVerticalDragCancel: () => print("onVerticalDragCancel"),
                onVerticalDragDown: (detail) => print("onVerticalDragDown"),
                onVerticalDragEnd: (detail) => print("onVerticalDragEnd"),
                onVerticalDragStart: (details) => print("onVerticalDragStart"),
                onVerticalDragUpdate: (details) => print("onVerticalDragUpdate"),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Column(
                    children: createColumeList(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _onScrollNotifation(ScrollNotification scrllNotifi) {
    return;
    var metris = scrllNotifi.metrics;
    print("xxxxxxxxxxxxxxxxxxxxxx");
    print(
        "viewportDimension : ${metris.viewportDimension} "); //The extent of the viewport along the [axisDirection].
    print("maxScrollExtent : ${metris.maxScrollExtent} "); //
    print("minScrollExtent : ${metris.minScrollExtent} ");
    print(
        "pixels : ${metris.pixels} "); //The current scroll position, in logical pixels along the [axisDirection].
    print("axisDirection :   ${metris.axisDirection} ");
    print("atEdge : ${metris.atEdge}");
    print(
        "outOfRange : ${metris.outOfRange}"); //pixels < minScrollExtent || pixels > maxScrollExtent;
    print("extentInside : ${metris.extentInside}");

    ///
    ///
    /// - maxScrollExtent 能滚动的范围 = 内容的高度 - viewportDimension + padding的高度
    /// 例如现在sv的高度是200，内容高度是300，padding高度是 5+10 ,所以此时maxScrollExtent是115
    ///
    ///
    /// - outOfRange 代表 是否在可滑动的范围的外面，例如 可滑动是 0 - 115 ,你滑到115就是滑到底了
    /// 然后你继续往上拉就是超过了 ，为true。
    ///
    ///
    /// - extentInside 的解释
    ///return viewportDimension
    ///  // "above" overscroll value
    ///  - (minScrollExtent - pixels).clamp(0, viewportDimension)
    ///  // "below" overscroll value
    ///  - (pixels - maxScrollExtent).clamp(0, viewportDimension);
    /// pixels 为 160的时候
    /// extentInside = 155
    /// 最大滑动是115 其实你多滑动了45 然后就是 200（viewportDimension） - 45 = 155
  }

  List<Widget> createColumeList() {
    return [
      Container(
        width: 100,
        height: 300,
        color: Colors.red,
      )
    ];
  }
}

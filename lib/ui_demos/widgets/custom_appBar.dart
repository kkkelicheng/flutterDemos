import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  double alpha;
  MyAppBar({this.alpha = 0.5}) : super();

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(44.0);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    print("padding $padding");
    return Container(
      padding: EdgeInsets.only(top: padding.top),
      color: Colors.orange.withOpacity(widget.alpha),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("详情", style: TextStyle(color: Colors.red, fontSize: 14)),
            SizedBox(width: 20),
            Text("评价", style: TextStyle(color: Colors.red, fontSize: 14)),
            SizedBox(width: 20),
            Text("记录", style: TextStyle(color: Colors.red, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class MyAppBarPage extends StatefulWidget {
  @override
  _MyAppBarPageState createState() => _MyAppBarPageState();
}

class _MyAppBarPageState extends State<MyAppBarPage> {
  double myAlpha = 0;
  @override
  Widget build(BuildContext context) {
    print("MyAppBarPage build");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(alpha: myAlpha),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          var metrics = notification.metrics;
          print(
              "notification minScrollExtent${metrics.minScrollExtent} max:${metrics.minScrollExtent} portSize:${metrics.viewportDimension} beforeExtent:${metrics.extentBefore}");
          myAlpha = _changeBarAlpha(metrics.extentBefore);
          setState(() {});
          return true;
        },
        child: Container(
          color: Colors.blue,
          child: ListView.builder(
              itemExtent: 44,
              itemBuilder: (ctx, index) {
                return Container(
                  child: Text("$index"),
                  color: Colors.blue,
                );
              }),
        ),
      ),
    );
  }

  double _changeBarAlpha(double defore) {
    if (defore >= 414) {
      return 1;
    } else {
      return defore / 414.0;
    }
  }
}

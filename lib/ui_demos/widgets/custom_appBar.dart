import 'package:flutter/material.dart';

///kToolbarHeight 就是NavigationItems的height
///关于Toolbar在AppBar上，可以看看文档，文档也没写详细。大概的意思就是跟iOS差不多的，换成了toolbar而已
///在iOS上NaviBar height = 44
///而这个在Flutter上，kToolbarHeight却是56
///自定义的AppBar的组成可以设计成 safearea的top + kToolbarHeight = AppBarHeight
///MediaQuery 是根据周围环境来确定数据的，在自定义AppBar中的top有数据，bottom没数据的
///但是在Page页面中 top和bottom都是有数据的
///自定义的AppBar中top的那部分系统帮你处理了，所以你处理的时候仅仅是处理kToolbarHeight这部分的
///所以结构是这样的 safearea 下面套个Wideget就好了，这个widget就是kToolbarHeight的高度，不用主动去设置
///返回preferredSize 直接返回kToolbarHeight
///
///官方AppBar的
///preferredSize = Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
///可以看到bottom不存在的时候就是kToolbarHeight的高度

///MyAppBar 这个例子是最开始的测试例子
///GoodDetailAppBar 是后面改进的例子
///custom_appBar2中的是一个完整的结合listView变化的例子,但是只是触发部分刷新

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  double alpha;
  MyAppBar({this.alpha = 0.5}) : super();

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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
    var padding2 = MediaQuery.of(context).padding;
    print("MyAppBarPage build padding2:$padding2");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GoodDetailAppBar(alpha: myAlpha),
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

class GoodDetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double alpha;
  GoodDetailAppBar({this.alpha = 0}) : super();

  @override
  _GoodDetailAppBarState createState() => _GoodDetailAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _GoodDetailAppBarState extends State<GoodDetailAppBar> {
  @override
  Widget build(BuildContext context) {
    var bgAlpha = widget.alpha;
    var titleAlpha = 1 - bgAlpha;
    return Container(
      color: Colors.white.withOpacity(bgAlpha),
      child: SafeArea(
          top: true,
          child: Container(
            child: Stack(
              children: [
                centerTitles(bgAlpha),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Opacity(
                        opacity: titleAlpha, child: Icon(Icons.account_circle)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Opacity(
                        opacity: titleAlpha, child: Icon(Icons.account_circle)),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget centerTitles(double titleAlpha) {
    return Opacity(
      opacity: titleAlpha,
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

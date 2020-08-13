import 'package:flutter/material.dart';

//注释看custom_appBar.dart
class GoodAppBarPage extends StatefulWidget {
  @override
  _GoodAppBarPageState createState() => _GoodAppBarPageState();
}

class _GoodAppBarPageState extends State<GoodAppBarPage> {
  @override
  Widget build(BuildContext context) {
    print("GoodAppBarPage build");
    return BarAlphaWidget(child: _buildBody());
  }

  Widget _buildBody() {
    return Builder(builder: (ctx) {
      var alphaWidget = BarAlphaWidget.of(ctx);
      print("_buildBody}");
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: GoodDetailAppBar2(), //引用的custom_appBar中的
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            var metrics = notification.metrics;
            alphaWidget.barAlpha.value = _changeBarAlpha(metrics.extentBefore);
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
    });
  }

  double _changeBarAlpha(double defore) {
    if (defore >= 414) {
      return 1;
    } else {
      return defore / 414.0;
    }
  }
}

class BarAlphaWidget extends InheritedWidget {
  ValueNotifier<double> barAlpha = ValueNotifier(0);

  BarAlphaWidget({Widget child}) : super(child: child);

  static BarAlphaWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BarAlphaWidget>();
  }

  @override
  bool updateShouldNotify(BarAlphaWidget oldWidget) {
    return barAlpha.value != oldWidget.barAlpha.value;
  }
}

class GoodDetailAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  @override
  _GoodDetailAppBar2State createState() => _GoodDetailAppBar2State();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _GoodDetailAppBar2State extends State<GoodDetailAppBar2> {
  @override
  Widget build(BuildContext context) {
    print("GoodDetailAppBar2 builder");
    var alphaWidget = BarAlphaWidget.of(context);
    return ValueListenableBuilder(
        valueListenable: alphaWidget.barAlpha,
        builder: (ctx, value, child) {
          return content(value);
        });
  }

  Widget content(bgAlpha) {
    print("build GoodDetailAppBar content");
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

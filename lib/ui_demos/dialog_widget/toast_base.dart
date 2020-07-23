import 'package:flutter/material.dart';

class TestOverlayDemo extends StatefulWidget {
  @override
  _TestOverlayDemoState createState() => _TestOverlayDemoState();
}

class _TestOverlayDemoState extends State<TestOverlayDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("悬浮框")),
      body: Column(
        children: <Widget>[
          RaisedButton(child: Text("测试 基本的toast"), onPressed: showToast)
        ],
      ),
    );
  }

  void showToast() {
    OverlayEntry entry = OverlayEntry(builder: (bCtx) {
      //这里要套一个Material，因为这里的Overlay的上下文根本不是Material的
      //Text不在特定风格下会有奇怪的风格问题
      return Material(
        color: Colors.transparent, //设置为透明
        child: Center(
            child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.2),
                child: Text("hello world"))),
      );
    });
    Overlay.of(context).insert(entry);
    Future.delayed(Duration(milliseconds: 1500), () {
      entry.remove();
    });
  }
}

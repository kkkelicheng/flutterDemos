import 'package:flutter/material.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> {
  @override
  void initState() {
    super.initState();
    print(" _Tab1PageState init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("UI 功能控件SafeArea 一般可以作为body的Widget"),
            Text(
"""
显示与隐藏,
1. Offstage 具有简单的隐藏功能，属性为true时表示隐藏，且不占用空间
2. Visibility 比Offstage 具有更多功能，visible属性为false时表示隐藏,属性见文档说明
3. Opacity 该控件提供透明度的设置能力，当完全透明时，亦可实现隐藏控件的效果

"""),
          ],
        ),
      ),
    );
  }
}

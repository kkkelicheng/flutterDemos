import 'package:flutter/material.dart';

class FLutterPagerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    print("width $w");
    return Scaffold(
      appBar: AppBar(title: Text("Pager")),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: GridPaper(
          color: Colors.black,
          interval: 300,
          divisions: 3,
          subdivisions: 5,
          child: Text("这是 GridPaper 的显示效果"),
        ),
      ),
    );
  }
}

///粗线包含的cell 就是 major division

///interval 是primary cell之间的的间隔
///
///
///divisions 文档中讲的点扯淡,应该是minor divisions 中的分割数

///  subdivisions!!! 次分割 the number of minor divisions
///If [subdivisions] is 5 (the default),
///The number of minor divisions within each major division,
///including the major division itself.
///it means that there will be four lines between each major ([divisions]) line.
///就是每个主方格里面分割的次数

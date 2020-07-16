import 'package:flutter/material.dart';

class ListWheelSVDemos extends StatefulWidget {
  @override
  _ListWheelSVDemosState createState() => _ListWheelSVDemosState();
}

class _ListWheelSVDemosState extends State<ListWheelSVDemos> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚轮demo")),
      body: Column(children: [
        Container(
          height: 100,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text("但是这个滚轮不会自动居中停止 $currentIndex"),
        ),
        Expanded(child: createBody())
      ]),
    );
  }

  Widget createBody() {
    return ListWheelScrollView.useDelegate(
      onSelectedItemChanged: (index) {
        print("onSelectedItemChanged $index");
        setState(() {
          currentIndex = index;
        });
      },
      useMagnifier: false, //使用放大镜 放大镜感觉有bug 先不用
      magnification: 0.8, //放大倍数 感觉有点问题
      squeeze: 1, //挤压 ， item之间的间隔，默认是1 值越大间隔越小
      itemExtent: 80,
      childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.primaries[index % 10],
              alignment: Alignment.center,
              child: Text('$index'),
            );
          },
          childCount: 50),
    );
  }
}

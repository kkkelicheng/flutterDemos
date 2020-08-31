import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/widgets/label_marquee.dart';

class ExpandCollapseAnimationPage extends StatefulWidget {
  @override
  _ExpandCollapseAnimationPageState createState() =>
      _ExpandCollapseAnimationPageState();
}

class _ExpandCollapseAnimationPageState
    extends State<ExpandCollapseAnimationPage> {
  @override
  void initState() {
    super.initState();
    testHeight();
  }

  @override
  Widget build(BuildContext context) {
    print("build ctx");
    return Scaffold(
      appBar: AppBar(title: Text("ExpandCollapse")),
      body: Container(child: Center(child: example())),
    );
  }

  Widget test() {
    return Text(
      "1www\nw133131",
      strutStyle: StrutStyle(
          fontSize: 20, leading: 0.1, height: 1, forceStrutHeight: true),
      style: TextStyle(backgroundColor: Colors.green),
      maxLines: 2,
    );
  }

  void testHeight() {
    double fontSize = 13;
    double height = calculateTextHeight(
        "特殊文\n特殊文", fontSize, FontWeight.normal, 300.0, 100);
    var content =
        "官方Text扩展组件，支持特殊文本效果（比如图片，@人）,自定义背景，自定义文本溢出效果,文本选择以及自定义选择菜单和选择器欢迎加入Flutter Candies，一起生产可爱的Flutter小糖果(QQ群181398081)";
    double height2 =
        calculateTextHeight(content, fontSize, FontWeight.normal, 300.0, 2);
    double height3 =
        calculateTextHeight(content, fontSize, FontWeight.normal, 300.0, 100);

    print("height:$height,height2:$height2 height3:$height3");
  }

  Widget example() {
    return const Text.rich(
      TextSpan(
        text: 'First line!\n',
        style: TextStyle(fontSize: 14, fontFamily: 'Roboto'),
        children: <TextSpan>[
          TextSpan(
            text: 'Second line!\n',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
          TextSpan(
            text: 'Third line!\n',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
      strutStyle: StrutStyle(
        fontFamily: 'Roboto',
        height: 1.5,
      ),
    );
  }
}

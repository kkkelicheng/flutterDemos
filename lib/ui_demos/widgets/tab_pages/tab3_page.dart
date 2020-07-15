import 'package:flutter/material.dart';

class Tab3Page extends StatefulWidget {
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> {
  @override
  void initState() {
    super.initState();
    print(" _Tab3PageState init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Tab3 Page"),
            Text("裁剪"),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text("ClipOval 子控件为正方形时剪裁为内切圆，若为矩形时，剪裁为内切椭圆"),
            ClipOval(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.orangeAccent,
              ),
            ),
            Text("ClipRRect R是Radius 将子控件剪裁为圆角矩形"),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.orangeAccent,
              ),
            ),
            Text("ClipRect 剪裁溢出部分"),
            ClipRect(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.orangeAccent,
              ),
            ),
            Text("CircleAvatar 用于头像显示,是一个视图控件，而不是功能控件"),
            CircleAvatar(
              child: Text("A"),
              radius: 100,
              backgroundImage: NetworkImage(
                  "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2738237435,1481797866&fm=175&app=25&f=JPEG?w=640&h=863&s=563636C1C44A774F420675010300F0D8"),
            )
          ],
        ),
      ),
    );
  }
}

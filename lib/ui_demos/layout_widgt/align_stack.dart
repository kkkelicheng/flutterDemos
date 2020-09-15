import 'package:flutter/material.dart';

class AlignStackPage extends StatefulWidget {
  @override
  _AlignStackPageState createState() => _AlignStackPageState();
}

class _AlignStackPageState extends State<AlignStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 150,
              color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Container(width: 100, height: 100, color: Colors.red),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(width: 20, height: 20, color: Colors.blue),
                  )
                ],
              ),
            ),
            Divider(),

            //上面的例子是Stack在给定的空间大小中，对自己的子view进行的布局

            //这里有一个小技巧，同时设置了Stack.alignment  Align.alignment会叠加
            //下面这个例子中Stack的高度是根据Column，撑起来的。
            //宽度是Align撑起来的。如果没有Align，宽度就是colume的内容大小的宽
            //Stack未定位的子组件大小由fit参数决定，默认值是StackFit.loose，表示子组件自己决定，StackFit.expand表示尽可能的大

            //所以有两种使用的方式 1. 外界决定尺寸 2. 子组件决定尺寸

            Container(
              color: Colors.green,
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 20,
                        color: Colors.blue,
                      ),
                      Text(
                        "1234444",
                        textAlign: TextAlign.left,
                      ),
                      Text("widthFactor和heightFactor")
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(width: 20, height: 30, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

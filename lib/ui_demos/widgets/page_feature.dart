import 'package:flutter/material.dart';

class DeepLearnPage extends StatefulWidget {
  @override
  _DeepLearnPageState createState() => _DeepLearnPageState();
}

class _DeepLearnPageState extends State<DeepLearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("深入Page"),
        // leading: ,如果设置了会覆盖drawer的触发
      ),
      body: Container(
        color: Colors.orange,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("""
1. page从上到下，
    AppBar ,
    Body,
    bottomSheet , 
    persistentFooterButtons ,
    bottomNavigationBar

2. page 2边还有drawer
drawer可以设置宽度
左边 Drawer
右边 EndDrawer

3. bottomSheet. 这个widget一般用来显示状态的，目前iOS都不是这么设计的，但是要知道有这个

4. bottomNavigationBar指定的是一个Widget，(iOS中的TabbarController)其实有一个配套的控件
BottomNavigationBar()

5. AppBar官方有多种案例，AppBar分上中下
上：从左到右 leading title actions
中：flexableSpaces
下： bottom，一般用来发tabbar

6. BottomAppBar 是一个不规则底部工具栏，（官方有例子，参考文档链接）
它比BottomNavigationBar 灵活，可以放置文字和图标等等控件。

""")
            ],
          ),
        ),
      ),
      // bottomSheet: Text("this is bottomSheet"),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        color: Colors.green.withAlpha(100),
        child: Center(
          child: Text("This is BottomSheet"),
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(onPressed: () {}, child: Text("FlatButton")),
        RaisedButton(onPressed: null, child: Text("RaisedButton")),
        Text("persistentFooterButtons 用的非常少")
      ],

      //bottomNavigationBar其实有一个配套的控件
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.cached), title: Text("cached")),
        BottomNavigationBarItem(icon: Icon(Icons.cake), title: Text("cake")),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), title: Text("gift")),
      ]),
      drawer: Container(
        width: 130,
        color: Colors.green,
        child: Center(child: Text("Drawer")),
      ),
      endDrawer: Container(
        width: 300,
        color: Colors.red,
        child: Center(child: Text("End Drawer")),
      ),
    );
  }
}

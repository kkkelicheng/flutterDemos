import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          toolbarOpacity: 0.5,
          actions: <Widget>[
            SizedBox(
                width: 24, height: 24, child: Container(color: Colors.orange)),
            Icon(Icons.access_alarm, color: Colors.white),
            Icon(Icons.access_time, color: Colors.white),
          ],
          title: Container(
            color: Colors.orange,
            height: 100,
            child: Center(
              child: Text(
                "折叠菜单demo",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: Container(
            color: Colors.black12,
            child: Column(
              children: [getBody(), Text("colume 接着ExpansionTile")],
            )));
  }

  Widget getBody() {
    return ExpansionTile(
        title: Text('折叠菜单 titles'),
        subtitle: Text("折叠菜单 subtitle"),
        leading: Icon(Icons.label, color: Colors.lightBlue),
        backgroundColor: Colors.red[200],
        initiallyExpanded: false,

        /// 是否默认展开
        children: <Widget>[
          ListTile(
            title: Text('这是主标题1'),
            subtitle: Text('这是副标题1'),
            onTap: () {
              print("点击了 1");
            },
          ),
          ListTile(
            title: Text('这是主标题2'),
            subtitle: Text('这是副标题2'),
            onTap: () {
              print("点击了 2");
            },
          )
        ]);
  }
}

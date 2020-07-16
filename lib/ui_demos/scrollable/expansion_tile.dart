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
          title: Text("折叠菜单demo"),
        ),
        body: Container(
            color: Colors.black12,
            child: Column(
              children: [getBody(), Text("colume 接着ExpansionTile")],
            )
          )
        );
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

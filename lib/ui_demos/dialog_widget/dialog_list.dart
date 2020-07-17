import 'package:flutter/material.dart';

class ListDialogDemo extends StatefulWidget {
  @override
  _ListDialogDemoState createState() => _ListDialogDemoState();
}

class _ListDialogDemoState extends State<ListDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义列表对话框"),
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("""
1. AlertDialog 通常用于提示型对话框
2. SimpleDialog 通常用于列表型对话框
3. Dialog 通常用于自定义布局元素的对话框

弹出对话框时，调用showDialog函数，将对话框控件传入，
由于对话框本身是路由，所以关闭对话框时，需使用Navigator.of(context).pop()

            """),
            FlatButton(onPressed: _alert_normalList, child: Text("ListView")),
          ],
        ),
      ),
    );
  }

//用listView，外面需要包裹一下
  void _alert_normalList() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500,
            child: Dialog(
              child: ListView(
                children: <Widget>[
                  Text("item 1"),
                  Text("item 2"),
                ],
              ),
            ),
          );
        });
  }
}

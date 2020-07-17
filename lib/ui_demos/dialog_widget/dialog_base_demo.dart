import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogText extends StatefulWidget {
  @override
  _DialogTextState createState() => _DialogTextState();
}

class _DialogTextState extends State<DialogText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对话框demo'),
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
            FlatButton(
                onPressed: _alert_matrial,
                child: Text("AlertDialog 提示型对话框 安卓风格")),
            FlatButton(
                onPressed: _alert_cupertino, child: Text("Alert 提示型对话框 iOS风格")),
            FlatButton(
                onPressed: _alert_list, child: Text("SimpleDialog 列表型对话框")),
          ],
        ),
      ),
    );
  }

  void _alert_matrial() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text("提示"),
          content: Text("这是一个对话框控件"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              //关闭对话框
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("知悉"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }

  void _alert_cupertino() {
    showCupertinoDialog(
        context: context,
        builder: (bCtx) {
          return CupertinoAlertDialog(
            title: Text("这个就是Title啦"),
            content: Text("这个就是content啦,iOS点击空白区域不会消失的"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "确定",
                  style: TextStyle(color: Colors.blue),
                ),
                //关闭对话框
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("第三个按钮"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _alert_list() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文繁体'),
                ),
              ),
            ],
          );
        });
    print("选择了$i");
  }
}

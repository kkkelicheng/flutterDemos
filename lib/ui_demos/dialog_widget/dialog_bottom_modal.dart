import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  //这里要写泛型， 不然后面提示不到泛型对应的方法
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("底部模态对话框Demo")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("""
            """),
            RaisedButton(
                onPressed: _showBottomSheetAction,
                child: Text("弹出bottom Sheet 有context问题")),
            Builder(builder: (lazyCtx) {
              return RaisedButton(
                  onPressed: () {
                    _showBottomSheetFromScaffold(lazyCtx);
                  },
                  child: Text("上下文弹出 bottomSheet"));
            }),
            RaisedButton(
                onPressed: _scaffoldStateShowBottomSheet,
                child: Text("scaffoldState句柄弹出bottom Sheet")),
            RaisedButton(
                onPressed: _modallyShowBottomSheet,
                child: Text("modal弹出底部的对话框")),
            Text(
                "1 \n 2 \n 3 \n 4 \n 5 \n 6  \n 7  \n 8 \n 9 可以看出来bottomSheet是盖在上面的"),
          ],
        ),
      ),
    );
  }

  void _showBottomSheetAction() {
    //这里有错啊 这里要求ancestor 是Scaffold ,但是这里的context是MyBottomSheetState
    //因为bottomSheet是Scaffold的一部分
    showBottomSheet(
        context: context,
        backgroundColor: Colors.orange[200],
        builder: (bCtx) {
          return ListView.builder(itemBuilder: (ctx, index) {
            return ListTile(title: Text("$index"));
          });
        });
  }

  void _showBottomSheetFromScaffold(BuildContext scaffoldCtx) {
    print("_showBottomSheetFromScaffold");
    //因为bottomSheet是Scaffold的一部分，点进去看，其实这里是ScaffoldState的方法
    //但是这里为什么只可以直接调用呢？因为这个方法确实是定义在了lib/src/matrial/bottom_sheet.dart中
    //这里如何拿到Scaffold的context？？？
    //之前不是讲过Builder？？？构造中可以拿到当前的上下文
    showBottomSheet(
        context: scaffoldCtx,
        backgroundColor: Colors.orange[200],
        builder: (bCtx) {
          return SizedBox(
            height: 300, //这里不设置会占满全屏
            child: ListView.builder(
                itemExtent: 44,
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  );
                }),
          );
        });
  }

  void _scaffoldStateShowBottomSheet() {
    //根据_showBottomSheetFromScaffold中的注释，
    // 其实是ScaffoldState调用的show方法 ， 所以拿到这个ScaffoldState就好了
    // flutter/src/material/scaffold.dart
    _scaffoldKey.currentState.showBottomSheet(
      (_) {
        return SizedBox(
          height: 300, //这里不设置会占满全屏
          child: ListView.builder(
              itemExtent: 44,
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text("scaffoldState $index"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                );
              }),
        );
      },
      backgroundColor: Colors.grey[500],
    );
  }

  void _modallyShowBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return SizedBox(
            height: 300, //这里可以不用填，有默认的高度
            child: ListView.builder(
                itemExtent: 44,
                itemCount: 100,
                itemBuilder: (ctx, index) {
                  return ListTile(title: Text("$index"));
                }),
          );
        });
  }
}

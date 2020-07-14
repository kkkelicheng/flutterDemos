import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/ui_list.dart';

import '../../demo_list.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SecondPage")),
      body: bulidCenterPops(),
    );
  }

  Widget bulidCenterPops() {
    return Center(
      child: Container(
        color: Colors.red,
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: <Widget>[
            InkWell(child: Text("pop to ui list page!"), onTap: _popToUIList),
            Padding(padding: EdgeInsets.only(top:10)),
            InkWell(child: Text("pop"), onTap: _popSelf),
            Padding(padding: EdgeInsets.only(top:10)),
            InkWell(child: Text("pop to other tips")),
            Padding(padding: EdgeInsets.only(top:10)),
            InkWell(child: Text("pop to root"), onTap: _popToRoot),
          ],
        ),
      ),
    );
  }

  _popToUIList() {
    //这里还是有bug的，体验不好，有中间页面闪动。
    Navigator.of(this.context).popUntil(ModalRoute.withName(UIList.routeName));
  }

  _popToRoot() async {
    NavigatorState navigator = Navigator.of(context);
    Route route = ModalRoute.of(context);

    //这句话会直接导致 这个页面变成了root
    //while (navigator.canPop()) navigator.removeRouteBelow(route);

    //这句话同_popToUIList 一样，会有闪动
    //while (navigator.canPop()) navigator.pop();

    //试试这个官方的
    _resetAndOpenPage();
  }

  void _resetAndOpenPage() {
    //我是真的服了这个傻缺设计，名字取得是_resetAndOpenPage，哈哈哈
     NavigatorState navigator = Navigator.of(context);
     //Push the given route onto the navigator, and then remove all the previous
  /// routes until the `predicate` returns true. 意思就是结果，还有上个页面，上个页面是原来的home。我真是笑了
     navigator.pushAndRemoveUntil(
       MaterialPageRoute(builder: (BuildContext context) => DemoList()),
       ModalRoute.withName('/'),
     );
  }

  _popSelf() {
    Navigator.of(this.context).pop();
  }

  _popToOther() {
    print("_popToOther tips:");
  }
}

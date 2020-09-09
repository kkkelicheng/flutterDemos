import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/router_examples/second_page.dart';
import 'package:flutterDemos/ui_demos/router_examples/third_page.dart';
//跳转页面的动画
import 'package:page_transition/page_transition.dart';
import 'login_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FirstPage")),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Text("push to second page"),
            onTap: () {
              var router = MaterialPageRoute(builder: (ctx) => SecondPage());
              Navigator.of(context).push(router);
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          InkWell(
            child: Text("push to third page"),
            onTap: () {
              //参数其实可以放在routeSetting里面
              var router = MaterialPageRoute(builder: (ctx) => ThirdPage(100));
              Navigator.of(context).push(router);
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          InkWell(
            child: Text("不存在的页面"),
            onTap: () {
              Navigator.of(context).pushNamed("nnnnothing");
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          InkWell(
            child: Text("从底部弹出登录页面"),
            onTap: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: LoginRoutePage()));
            },
          )
        ],
      )),
    );
  }
}

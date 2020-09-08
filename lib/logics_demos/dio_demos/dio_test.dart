import 'package:flutter/material.dart';
import 'package:flutterDemos/logics_demos/dio_demos/dio_baseModel.dart';
import 'package:flutterDemos/logics_demos/dio_demos/dio_error.dart';
import 'package:flutterDemos/logics_demos/dio_demos/dio_singlone.dart';

class DioTestPage extends StatefulWidget {
  @override
  _DioTestPageState createState() => _DioTestPageState();
}

class _DioTestPageState extends State<DioTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dio 测试")),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _requestHome,
              child: Text("首页数据"),
            )
          ],
        )),
      ),
    );
  }

  void _requestHome() async {
    try {
      BaseEntity base = await DioManager()
          .get("/api/member/banner/lis", params: {"type": "1"});
      print("base : ${base.code}");
    } on ErrorEntity catch (e) {
      print("catched ErrorEntity ${e.code}");
    }
  }

  void test() {}
}

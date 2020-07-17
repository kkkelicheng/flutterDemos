import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://pub.dev/packages/shared_preferences

class UserDefaultDemo extends StatefulWidget {
  @override
  _UserDefaultDemoState createState() => _UserDefaultDemoState();
}

class _UserDefaultDemoState extends State<UserDefaultDemo> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Plist demo")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(onPressed: _save, child: Text("存数据")),
            Padding(padding: EdgeInsets.only(top: 20)),
            RaisedButton(onPressed: _printDatas, child: Text("读数据")),
          ],
        ),
      ),
    );
  }

  void _save() {
    _prefs.then((SharedPreferences p) {
      p.setString("nonull", "not null value");
      p.setBool("isFirstLoad", false);
    });
  }

  void _printDatas() {
    _prefs.then((p) {
      String noString = p.getString("no_key_string");
      bool isFirstLoad = p.getBool("isFirstLoad");
      String nonull = p.getString("nonull");
      print("noString $noString");
      print("isFirstLoad $isFirstLoad");
      print("nonull $nonull");
    });
  }
}

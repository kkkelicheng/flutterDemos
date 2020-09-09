import 'package:flutter/material.dart';

class LoginRoutePage extends StatefulWidget {
  @override
  _LoginRoutePageState createState() => _LoginRoutePageState();
}

class _LoginRoutePageState extends State<LoginRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("123")),
      body: Container(
        child: Center(child: Text("登录页面")),
      ),
    );
  }
}

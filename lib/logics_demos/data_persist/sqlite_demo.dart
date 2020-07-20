import 'package:flutter/material.dart';

class SqDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SqDemo")),
      body: Center(
        child: Column(
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: "https://pub.dev/packages/sqflite",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue))),
          ],
        ),
      ),
    );
  }
}

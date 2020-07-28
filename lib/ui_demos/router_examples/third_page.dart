import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage(this.pageId);
  final int pageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("third page")),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          print("pressed");
        },
        child: Text("$pageId"),
      )),
    );
  }
}

import 'package:flutter/material.dart';

class FluroPage2 extends StatelessWidget {
  FluroPage2(this.pageId) : super();
  final int pageId;

  @override
  Widget build(BuildContext context) {
    print("FluroPage2 pageid is $pageId");
    return Scaffold(
      appBar: AppBar(title: Text("FluroPage2")),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("pageId:$pageId"),
      )),
    );
  }
}

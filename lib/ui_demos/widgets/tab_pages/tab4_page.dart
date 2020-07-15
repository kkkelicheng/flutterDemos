import 'package:flutter/material.dart';

class Tab4Page extends StatefulWidget {
  @override
  _Tab4PageState createState() => _Tab4PageState();
}

class _Tab4PageState extends State<Tab4Page> {

  @override
  void initState() {
    super.initState();
    print(" _Tab4PageState init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Tab4 Page"),
            Text("自定义剪裁"),
            

          ],
        ),
      ),
    );
  }
}
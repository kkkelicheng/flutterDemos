
import 'package:flutter/material.dart';

class FlexPage extends StatefulWidget {
  @override
  _FlexPageState createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Flex Page")
      ),
      body: Container(
        color: Colors.cyan[100],
        child: Flex(
          direction:Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("123"),
            Text("-hdhajdhjahjdahjdhajhd-"),
            Container(
              color:Colors.red,
              width: 100,
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
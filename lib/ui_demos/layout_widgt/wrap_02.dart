import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Wrap demo")),
      body: Container(
        child: Wrap(
          runSpacing: 20,
          spacing: 10,
          children: <Widget>[
            SizedBox(
              height: 100,
              width:100,
              child: Container(
                color:Colors.green[200]
              ),
            ),
            Chip(label: Text("123"), backgroundColor: Colors.red[50],deleteIcon: Icon(Icons.delete),onDeleted: (){}),
            Chip(label: Text("123 \n 131"), backgroundColor: Colors.red[300]),
            Chip(label: Text("12444444443"), backgroundColor: Colors.red[50]),
            Chip(label: Text("3"), backgroundColor: Colors.red[50]),
            Chip(label: Text("1244443"), backgroundColor: Colors.red[50]),
            Chip(label: Text("123"), backgroundColor: Colors.red[50]),
          ],
        ),
      ),
    );
  }
}

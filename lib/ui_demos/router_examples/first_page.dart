import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/router_examples/second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("FirstPage")
      ),
      body: Center(
        child:InkWell(
          child: Text("push to second page"),
          onTap: (){
            var router = MaterialPageRoute(builder: (ctx) => SecondPage());
            Navigator.of(context).push(router);
          },
        )
      ),
    );
  }
}
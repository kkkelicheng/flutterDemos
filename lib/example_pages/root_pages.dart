

import 'package:flutter/material.dart';
import 'package:flutterDemos/example_pages/ds_home.dart';

class DSDemos extends StatelessWidget {
  final List<String> demosTitles = ["电商首页",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("LogicsDemos")));
  }

  Widget createList() {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              listTapedIndex(ctx, index);
            },
            child: ListTile(
              title: Text(demosTitles[index]),
              trailing: Icon(Icons.arrow_right),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: demosTitles.length);
  }

  void listTapedIndex(ctx, index) {
    if (index == 0) {
      var page = ShopHomePage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    
    // if (index == 1) {
    //   var page = RootStateDemos();
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    // }

  }
}

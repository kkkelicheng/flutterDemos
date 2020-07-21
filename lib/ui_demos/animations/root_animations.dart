import 'package:flutter/material.dart';

import 'animations1.dart';
import 'animations_base.dart';

class RootAnitmations extends StatelessWidget {
  final List<String> demosTitles = [
    "动画的基础",
    "简单动画1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("动画demos")));
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
      var page = AnimationBaseDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 1) {
      var page = Animations1();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

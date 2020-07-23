import 'package:flutter/material.dart';

import 'animations1.dart';
import 'animations2.dart';
import 'animations3.dart';
import 'animations4.dart';
import 'animations_base.dart';

class RootAnitmations extends StatelessWidget {
  final List<String> demosTitles = [
    "动画的基础",
    "简单线性动画1",
    "简单的非线性动画2",
    "动画组件demo",
    "自定义动画组件demo",
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
    if (index == 2) {
      var page = Animations2();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 3) {
      var page = Animations3();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
     if (index == 4) {
      var page = Animations4();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

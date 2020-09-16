
import 'package:flutter/material.dart';

import 'paint_canvas.dart';

class RootRrawsList extends StatelessWidget {
  final List<String> demosTitles = [
    "Paint Canvas",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: createList(),
        ),
        appBar: AppBar(title: Text("Widget List")));
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
      var page = PaintCanvasPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    // if (index == 1) {
    //   var page = WrapPage();
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    // }
    // if (index == 3) {
    //   var page = AlignStackPage();
    //   Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    // }
  }
}

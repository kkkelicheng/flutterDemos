import 'package:flutter/material.dart';

class ScaleSizeLabelDemo extends StatelessWidget {
  final String content = "你好你好，空你急哇12345678910";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("自动缩小label")),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 100,
            child: Column(
              children: <Widget>[
                Text(
                  "$content",
                  style: TextStyle(fontSize: 13),
                  maxLines: 1,
                ),
                AutoFontLabelWidget("$content", 13)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AutoFontLabelWidget extends StatelessWidget {
  final String content;
  final double fontSize;
  final int maxLine;
  AutoFontLabelWidget(this.content, this.fontSize, {this.maxLine = 1})
      : super();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0,
        child: FittedBox(
            fit: BoxFit.scaleDown,
            // Optionally apply `alignment` to position the text inside the box:
            //alignment: Alignment.topRight,
            child: Text('$content',
                style: TextStyle(fontSize: fontSize), maxLines: maxLine)));
  }
}

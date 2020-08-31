import 'package:flutter/material.dart';

class ReadMoreView extends StatefulWidget {
  final int collapseCount;
  final String content;
  final FontWeight weight;
  final double fontSize;
  ReadMoreView(
      {this.collapseCount = 2,
      @required this.content,
      this.weight = FontWeight.normal,
      this.fontSize = 13,
      Key key})
      : super(key: key);
  @override
  _ReadMoreViewState createState() => _ReadMoreViewState();
}

class _ReadMoreViewState extends State<ReadMoreView> {
  bool isCollapseStatus = true;
  bool isNeedCollapse = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    needCollapse(MediaQuery.of(context).size.width - 10 * 2);
  }

  @override
  void didUpdateWidget(ReadMoreView oldWidget) {
    super.didUpdateWidget(oldWidget);
    needCollapse(MediaQuery.of(context).size.width - 10 * 2);
  }

  @override
  Widget build(BuildContext context) {
    print("\n content:${widget.content} isNeedCollapse:$isNeedCollapse");
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          contentWidget(),
          isNeedCollapse ? moreWidget() : Container()
        ],
      ),
    );
  }

  void needCollapse(double prefredWidth) {
    double width = MediaQuery.of(context).size.width - 10 * 2;
    String base = "口" + "\n口" * widget.collapseCount;
    double baseHeight = myHeight(
        base, widget.fontSize, widget.weight, width, widget.collapseCount);
    double contentHeight =
        myHeight(widget.content, widget.fontSize, widget.weight, width, 100000);
    isNeedCollapse = contentHeight > baseHeight;
  }

  double myHeight(String value, double fontSize, FontWeight fontWeight,
      double maxWidth, int maxLines) {
    TextPainter painter = TextPainter(
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            )));
    painter.layout(maxWidth: maxWidth);
    return painter.height;
  }

  Widget contentWidget() {
    int maxCount = isCollapseStatus ? widget.collapseCount : 10000;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        widget.content,
        maxLines: maxCount,
      ),
    );
  }

  void _onMoreTap() {
    setState(() {
      isCollapseStatus = !isCollapseStatus;
    });
  }

  Widget moreWidget() {
    return Container(
      color: Colors.red,
      child: GestureDetector(
        child: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("更多"),
            ClipOval(
              child: Container(
                color: Colors.grey,
                width: 20,
                height: 20,
                child: Center(
                  child: Text("∧"),
                ),
              ),
            )
          ],
        )),
        onTap: _onMoreTap,
      ),
    );
  }
}

class ReadMorePage extends StatefulWidget {
  @override
  _ReadMorePageState createState() => _ReadMorePageState();
}

class _ReadMorePageState extends State<ReadMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("更多")),
      body: Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            children: <Widget>[
              ReadMoreView(
                content: "你好你好啊就一行文字",
              ),
              SizedBox(
                height: 50,
              ),
              ReadMoreView(
                content: "你好你好啊就2行文字,\n你好你好啊就2行文字",
              ),
              SizedBox(
                height: 50,
              ),
              ReadMoreView(
                content: "你好你好啊就3行文字\n你好你好啊就3行文字\n你好你好啊就3行文字",
              )
            ],
          ),
        ),
      ),
    );
  }
}

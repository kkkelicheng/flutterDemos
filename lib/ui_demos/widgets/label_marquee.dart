import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MarqueeLabelDemo extends StatefulWidget {
  @override
  _MarqueeLabelDemoState createState() => _MarqueeLabelDemoState();
}

class _MarqueeLabelDemoState extends State<MarqueeLabelDemo> {
  final content =
      "begin中共中央总书记、国家主席、中央军委主席习近平出席仪式，宣布北斗三号全球卫星导航系统正式开通。--------end";
  final content2 = "12345ABCDE";
  GlobalKey<_MarqueeLabelState> _gk = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print("MarqueeLabelDemo build!!!!");
    return Scaffold(
      appBar: AppBar(
        title: Text("跑马灯Label"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // SizedBox(
            //   width: double.infinity,
            //   height: 44,
            //   child: MarqueeLabel(content, key: _gk),
            // ),
            SizedBox(
              width: 200,
              height: 44,
              child: MarqueeLabel(content, key: _gk),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            // RaisedButton(onPressed: _getWidth, child: Text("获取高度")),
            // Padding(padding: EdgeInsets.only(top: 10)),
            RaisedButton(onPressed: _goScroll, child: Text("滚动")),
            Padding(padding: EdgeInsets.only(top: 10)),
            RaisedButton(onPressed: _stopScroll, child: Text("停止滚动")),
            Padding(padding: EdgeInsets.only(top: 10)),
          ],
        ),
      ),
    );
  }

  _getWidth() {
    var size1 = calculateTextSize(content, 13, FontWeight.w400, 10000, 1);
    print("size1 : $size1");

    var size2 = calculateTextSize(content2, 13, FontWeight.w400, 10000, 1);
    print("size2 $size2");
  }

  _goScroll() {
    _gk.currentState.startAnimation();
  }

  _stopScroll() {
    _gk.currentState.stopAnimation();
  }
}

class MarqueeLabel extends StatefulWidget {
  MarqueeLabel(this.content, {Key key}) : super(key: key);
  final String content;
  @override
  _MarqueeLabelState createState() => _MarqueeLabelState();
}

class _MarqueeLabelState extends State<MarqueeLabel>
    with SingleTickerProviderStateMixin {
  AnimationController _aController;
  Animation _animation;
  bool isGetWidth = false;
  double self_width = 0;
  double label_width = 0;

  @override
  void initState() {
    super.initState();
    _initAnimationDatas();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback(_getContainerWidth);
  }

  @override
  void didUpdateWidget(MarqueeLabel oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback(_getContainerWidth);
  }

  _getContainerWidth(_) {
    print("_getContainerWidth");
    if (!isGetWidth) {
      isGetWidth = true;
      self_width = context.size.width;
      var size1 =
          calculateTextSize(widget.content, 13, FontWeight.w400, 10000, 1);
      label_width = size1.width;
      print("size1 : $size1");
      print("self_width :$self_width  label_width:$label_width");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Colors.yellow.withAlpha(100)),
        Positioned(
            left: _animation?.value ?? 0,
            child: Text(
              widget.content,
              style: TextStyle(fontSize: 13),
            ))
      ],
    );
  }

  void startAnimation() {
    if (!isGetWidth) {
      print("not isGetWidth");
      return;
    }
    var delta_width = label_width - self_width;
    if (delta_width < 0) {
      print("宽度有限");
      return;
    }
    Tween<double> tween = Tween(begin: 0, end: -delta_width);
    _animation = tween.animate(_aController);
    _aController.forward();
  }

  void stopAnimation() {
    print("_aController status ${_aController.status}");
    _aController.stop();
  }

  void _initAnimationDatas() {
    _aController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _aController.addListener(() {
      print(_animation.value);
      setState(() {});
    });
    _aController.addStatusListener((status) {
      print("$status");
      if (status == AnimationStatus.completed) {
        _aController.reverse();
      }
    });
  }
}

///value: 文本内容；fontSize : 文字的大小；fontWeight：文字权重；maxWidth：文本框的最大宽度；maxLines：文本支持最大多少行
double calculateTextHeight(String value, fontSize, FontWeight fontWeight,
    double maxWidth, int maxLines) {
  // value = filterText(value);
  TextPainter painter = TextPainter(

      ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
          text: value,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          )));
  painter.layout(maxWidth: maxWidth);

  ///文字的宽度:painter.width
  return painter.height;
}

///value: 文本内容；fontSize : 文字的大小；fontWeight：文字权重；maxWidth：文本框的最大宽度；maxLines：文本支持最大多少行
Size calculateTextSize(String value, double fontSize, FontWeight fontWeight,
    double maxWidth, int maxLines) {
  // value = filterText(value);
  TextPainter painter = TextPainter(

      ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
          text: value,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          )));
  painter.layout(maxWidth: maxWidth);

  ///文字的宽度:painter.width
  return painter.size;
}

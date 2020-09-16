import 'package:flutter/material.dart';

class PaintCanvasPage extends StatefulWidget {
  @override
  _PaintCanvasPageState createState() => _PaintCanvasPageState();
}

class _PaintCanvasPageState extends State<PaintCanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("绘制")),
      body: Stack(
        children: [
          Center(
            child: VerticalDivider(),
          ),
          Center(
            child: CustomPaint(
              size: Size(40, 40), //指定画布大小
              painter: MyPainter(),
            ),
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 该方法中实现绘制逻辑
    Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(0, size.height * 0.5), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    ///  返回 true 会进行重绘，否则就只会绘制一次
    return false;
  }
}

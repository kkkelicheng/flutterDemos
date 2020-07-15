import 'package:flutter/material.dart';
import 'dart:math' as math;

/// 曲线背景
class CurveBgWidget extends StatelessWidget {

  final Color color;

  CurveBgWidget({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: color,
      child: ClipPath(
        //路径裁切组件
        clipper: CurveClipper(), //路径
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFEA3D87), Color(0xFFFF7095)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 320.0,
        ),
      ),
    );
  }
}

/// 曲线路径
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()..lineTo(0, size.height - 60.0);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEdnPoint = Offset(size.width, size.height - 60.0);

    path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEdnPoint.dx,
        firstEdnPoint.dy);

    path..lineTo(size.width, size.height - 60.0)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class IrregularContainer extends StatelessWidget{
  final double width;
  final double height;
  final double circleRadius;
  final double borderRadius;
  final double circleTopOffset;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry padding;

  IrregularContainer({
    this.child,
    this.width,
    this.height,
    this.circleRadius,
    this.borderRadius,
    this.circleTopOffset,
    this.color,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: IrregularClipper(circleRadius,circleTopOffset,borderRadius),
      child: Container(
        padding: padding,
        color: color,
        height: height,
        width: width,
        child: child,
      ),
    );
  }

}

/// 不规则剪裁
class IrregularClipper extends CustomClipper<Path> {

  double circleTopOffset = 20;
  double circleRadius = 70;
  double borderRadius = 0;

  IrregularClipper(this.circleRadius,this.circleTopOffset,this.borderRadius);

  /// 角度转弧度公式
  double _d2R(double degree) {
    return (math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radian = math.acos((circleRadius-circleTopOffset)/circleRadius);
    var path = Path()
      ..arcTo(Rect.fromCircle(center: Offset(borderRadius,borderRadius+circleTopOffset),radius: borderRadius),-math.pi,math.pi/2,false)
      ..lineTo(size.width-borderRadius, circleTopOffset)
      ..arcTo(Rect.fromCircle(center: Offset(size.width/2,circleRadius),radius: circleRadius),-(math.pi/2+radian),2*radian,false)
      ..arcTo(Rect.fromCircle(center: Offset(size.width-borderRadius,borderRadius+circleTopOffset),radius: borderRadius),-math.pi/2,math.pi/2,false)
      ..lineTo(size.width, size.height-borderRadius)
      ..arcTo(Rect.fromCircle(center: Offset(size.width-borderRadius,size.height-borderRadius),radius: borderRadius),0,math.pi/2,false)
      ..lineTo(borderRadius, size.height)
      ..arcTo(Rect.fromCircle(center: Offset(borderRadius,size.height-borderRadius),radius: borderRadius),math.pi/2,math.pi/2,false)
      ..lineTo(0, borderRadius+circleTopOffset);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TriangleClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width/2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
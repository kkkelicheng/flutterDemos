import 'package:flutter/material.dart';

class Animations3 extends StatefulWidget {
  @override
  _Animations3State createState() => _Animations3State();
}

class _Animations3State extends State<Animations3>
    with SingleTickerProviderStateMixin {
  //这两个在用动画控件的时候还是要用到，1，要控制动画 2 要设置值
  AnimationController _aController;
  Animation<double> _scaleAnimation;

  Animation<double> _opacityAnimation;

  @override
  void dispose() {
    //动画释放资源
    _aController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _aController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(_aController);
    _opacityAnimation =
        Tween<double>(begin: 0.1, end: 0.8).animate(_aController);
  }

  Widget box() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Center(child: Text("A")),
        ),
      ),
    );
  }

  Widget buttons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: boxBigger, child: Text("Box 变大")),
        ],
      ),
    );
  }

  void boxBigger() {
    //就是从 begin到end 叫向前
    _aController.forward();
    //结果是中间的字 位置居然有问题。。。
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter的动画控件")),
        body: Stack(
          children: <Widget>[box(), buttons()],
        ));
  }
}

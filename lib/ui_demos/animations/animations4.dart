import 'package:flutter/material.dart';

class Animations4 extends StatefulWidget {
  @override
  _Animations4State createState() => _Animations4State();
}

class _Animations4State extends State<Animations4>
    with SingleTickerProviderStateMixin {
  //这两个在用动画控件的时候还是要用到，1，要控制动画 2 要设置值
  AnimationController _aController;

  Animation<double> _sizeAnimation;

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
    _sizeAnimation = Tween<double>(begin: 10, end: 200).animate(_aController);
  }

  Widget box() {
    return MyScaleWidget(
        animation: _sizeAnimation, child: Container(color: Colors.green));
  }

  Widget animationbuildWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (ctx, w) {
            return Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                color: Colors.red);
          }),
    );
  }

  Widget buttons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          Text("""
1. 第一种方式封装代码，自己写
2. 使用AnimationBuilder
          """),
          RaisedButton(onPressed: boxBigger, child: Text(" 2个 Box 变大")),
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
        appBar: AppBar(title: Text("自定义动画控件")),
        body: SafeArea(
          child: Stack(
            children: <Widget>[box(), buttons(), animationbuildWidget()],
          ),
        ));
  }
}

//这里就是自定义的动画控件了  AnimatedWidget内部是封装了监听和刷新的代码
//自定义就是需要把变动的值，应用到Animation中，然后监听，Animation本身就是可监听的。
class MyScaleWidget extends AnimatedWidget {
  final Widget child;
  MyScaleWidget({this.child, Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation a = this.listenable;
    return SizedBox(width: a.value, height: a.value, child: child);
  }
}

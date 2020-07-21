import 'package:flutter/material.dart';

class Animations1 extends StatefulWidget {
  @override
  _Animations1State createState() => _Animations1State();
}

class _Animations1State extends State<Animations1>
    with SingleTickerProviderStateMixin {
  AnimationController _aController;
  Animation _animation;

  @override
  void dispose() {
    //动画释放资源
    _aController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initAnimationDatas();
  }

  Widget box() {
    //这里的数据是从新的 Animation中拿的，旧的是AnimationController
    print("_animation value ${_animation.value}");
    return Container(
      width: _animation.value,
      height: _animation.value,
      color: Colors.red,
      child: Center(child: Text("A")),
    );
  }

  void _initAnimationDatas() {
    _aController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    //创建Tween估值器,包含了起始和结束的值
    Tween<double> tween = Tween(begin: 100, end: 200);
    //估值器 + AnimationController（自己其实也是Animation） 就产生了新的 Animation，一个包含了动画数据（补间值）的东西
    _animation = tween.animate(_aController);
    //AnimationController 控制 Ticker，后面ticker的操作都是通过AnimationController来进行的

    _aController.addListener(() {
      print(_animation.value);
      //刷新界面
      setState(() {});
    });

    //状态的监听 也可以使用_aController 进行监听
    //addStatusListener 是Animation 的方法
    _animation.addStatusListener((status) {
      //forward 对应的是  AnimationStatus.forward , AnimationStatus.completed
      //reverse 对应的是  AnimationStatus.reverse , AnimationStatus.dismissed
      // AnimationStatus 有四种
      print("$status");
      if (status == AnimationStatus.completed) {
        //假如这里想要重复动画 不能直接进行 forward操作，因为此时的Animation是在终点，而不是开始
        //可以 先reset 然后再 forward

        //但是这里可以进行reverse操作，因为reverse是从Animation是在终点到起点
      }
    });
  }

  Widget buttons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: boxBigger, child: Text("Box 变大")),
          RaisedButton(onPressed: boxBiggerReverse, child: Text("Box 逆向")),
          RaisedButton(onPressed: boxBiggerRepeat, child: Text("Bix repeat")),
          RaisedButton(onPressed: boxStop, child: Text("stop")),
          RaisedButton(onPressed: boxStatus, child: Text("动画状态")),
        ],
      ),
    );
  }

  void boxStatus() {
    print("Animation addStatusListener");
  }

  void boxStop() {
    _aController.stop();
  }

  void boxBigger() {
    //就是从 begin到end 叫向前
    _aController.forward();
  }

  void boxBiggerReverse() {
    //就是从 end 到 begin 反向
    _aController.reverse();
  }

  void boxBiggerRepeat() {
    //就是反复从 begin到end
    _aController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("简单的动画")),
        body: Stack(
          children: <Widget>[box(), buttons()],
        ));
  }
}

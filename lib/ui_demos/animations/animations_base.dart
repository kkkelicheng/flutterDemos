import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationBaseDemo extends StatefulWidget {
  @override
  _AnimationBaseDemoState createState() => _AnimationBaseDemoState();
}

class _AnimationBaseDemoState extends State<AnimationBaseDemo>
    with SingleTickerProviderStateMixin {
  Ticker tker;

  AnimationController _aController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _initAnimationDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画的基础")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(onPressed: _testTicker, child: Text("测试 Tiker")),
            RaisedButton(
                onPressed: _testAnimation, child: Text("Tiker驱动AnimaCtl产生估值")),
          ],
        ),
      ),
    );
  }

  void _testTicker() {
    tker = Ticker((timeInterval) {
      //产生的每一帧都会调用
      print("$timeInterval");
    }, debugLabel: "MyTestTicker");
    tker.start();
    Future.delayed(Duration(seconds: 10), () {
      print('延时10s执行');
      tker.stop();
    });
  }

  void _initAnimationDatas() {
    _aController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    //创建Tween估值器,包含了起始和结束的值
    Tween tween = Tween(begin: 100, end: 200);
    //估值器 + AnimationController 就产生了 Animation，一个包含了动画数据（补间值）的东西
    _animation = tween.animate(_aController);
    //AnimationController 控制 Ticker，后面ticker的操作都是通过AnimationController来进行的

    _aController.addListener(() {
      print(_animation.value);
    });
  }

  void _testAnimation() {
    //必要的数据在init中已经做了
    //相当于启动了关联ticker的start
    _aController.forward();
  }
}

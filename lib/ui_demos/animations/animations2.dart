import 'package:flutter/material.dart';

class Animations2 extends StatefulWidget {
  @override
  _Animations2State createState() => _Animations2State();
}

class _Animations2State extends State<Animations2>
    with SingleTickerProviderStateMixin {
  AnimationController _aController;
  //有几个动画效果就创建几个。。。
  Animation _animation;
  Animation<Color> _colorAnimation;

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
      color: _colorAnimation != null ? _colorAnimation.value : Colors.green,
      child: Center(child: Text("A")),
    );
  }

  void _initAnimationDatas() {
    _aController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    //创建插值器 用来计算估值的 curvedAnimation 其实也实现了Animation
    //parent ： 指明加到哪个动画上
    //curve : 指明用哪个曲线
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _aController, curve: Curves.ease);

    //创建Tween估值器,包含了起始和结束的值
    Tween<double> tween = Tween(begin: 100, end: 200);

    //将插值器关联到估值器上
    _animation = tween.animate(curvedAnimation);

    /// 具体实现Animation的类可以看看文档
    /// 这里说几个
    /// CompoundAnimation 组合多个动画接口
    /// CurvedAnimation 曲线动画
    /// ReverseAniamtion 反向动画
    /// AnimationController 动画控制器
    ///

    _aController.addListener(() {
      print(_animation.value);
      //刷新界面
      setState(() {});
    });
  }

  Widget buttons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: boxBigger, child: Text("Box 变大")),
          RaisedButton(onPressed: boxBiggerReverse, child: Text("Box 逆向")),
          RaisedButton(onPressed: boxColor, child: Text("Box 变化颜色")),
          RaisedButton(
              onPressed: otherWayTrieveAniationValue, child: Text("获取动画的值")),
        ],
      ),
    );
  }

  void boxBigger() {
    //就是从 begin到end 叫向前
    _aController.forward();
  }

  void boxBiggerReverse() {
    //就是从 end 到 begin 反向
    _aController.reverse();
  }

  void boxColor() {
    //颜色如何补间呢？？？？
    //使用Tween的子类 Flutter封装了很多,例如 ColorTween TextStyleTween BorderTween...
    //创建改变颜色的动画
    Tween<Color> colorTween = ColorTween(begin: Colors.red, end: Colors.black);
    _colorAnimation = colorTween.animate(_aController);
    _aController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("简单的非线性动画")),
        body: Stack(
          children: <Widget>[box(), buttons()],
        ));
  }

  void otherWayTrieveAniationValue() {
    //之前是通过生成新的animate对象 然后获取其中的value 就得到了值

    //现在介绍第二种
    Tween<double> d_t = Tween(begin: 10, end: 100);
    //从这里就可以知道 Animationcontroller包含了状态，在进行的时候，通过估值器 + Controller的状态算出值来
    _aController.addListener(() {
      print("trieve double  ${d_t.evaluate(_aController)}");
    });
    _aController.forward();
  }

  //另外插值和估值结合 写的一种方式
  void otherUseCurve() {
    Animatable tween = Tween<double>(begin: 10, end: 100)
        .chain(CurveTween(curve: Curves.bounceIn));
    _aController.drive(tween);
  }
}

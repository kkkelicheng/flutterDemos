
import 'package:flutter/material.dart';

class ValueBandingTestPage extends StatefulWidget {
  @override
  _ValueBandingTestPageState createState() => _ValueBandingTestPageState();
}

class _ValueBandingTestPageState extends State<ValueBandingTestPage> {

  @override
  Widget build(BuildContext context) {
    return CountWidget(
      child: Builder(builder: (ctx){
        CountWidget ctWidget = CountWidget.of(ctx);
        return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //使用ValueListenableBuilder控件。该控件本质上仍然是对StatefulWidget的封装
              Text("""
局部刷新，使用ValueListenableBuilder控件。该控件本质上仍然是对StatefulWidget的封装

InheritedWidget (数据共享)
              + 
ValueListenableBuilder (封装的STF，监听数据变化)
               + 
ValueNotifier （数据的包装类）
              """),
              ValueListenableBuilder(
                builder: (context, value, child) {
                  return Text('$value',style: TextStyle(fontSize: 20),);
                },
                valueListenable: ctWidget.count,
              ),
              BottomWidget()
            ],
          ),
        ),
      );
      })
    );
  }
}

class CountWidget extends InheritedWidget{
  final ValueNotifier<int> count = ValueNotifier(0);

  CountWidget({Widget child}):super(child:child);

  static CountWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CountWidget>();
  }

  @override
  bool updateShouldNotify(CountWidget oldWidget) {
    return count.value != oldWidget.count.value;
  }
}

class BottomWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _count = CountWidget.of(context).count;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () => _count.value--,
          child: Icon(Icons.remove),
        ),
        /// 不会刷新
        Text('${_count.value}'),
        FlatButton(
          onPressed: () => _count.value++,
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
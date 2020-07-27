import 'package:flutter/material.dart';

class InheritedTestPage extends StatefulWidget {
  @override
  _InheritedTestPageState createState() => _InheritedTestPageState();
}

class _InheritedTestPageState extends State<InheritedTestPage> {

  @override
  Widget build(BuildContext context) {
    print("_InheritedTestPageState build");
    return CountWidget(child: buildScaffold());
  }

  Widget buildScaffold(){
    return Builder(builder: (ctx){ //ctx拿到的是CountWidget的上下文
        print("buildScaffold");
        var count = CountWidget.of(ctx).count;
        return Scaffold(
        appBar: AppBar(title: Text("数据共享例子")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('count = $count',style: TextStyle(fontSize: 20),),
              BottomWidget()
            ],
          ),
        ),
      );
      }
    );


  }
}

/// 继承自InheritedWidget，实现updateShouldNotify方法
class CountWidget extends InheritedWidget{

  CountWidget({Widget child}):super(child:child);

  final int count = 100;

  static CountWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CountWidget>();
  }

  @override
  bool updateShouldNotify(CountWidget oldWidget) {
    return count != oldWidget.count;
  }
}

class BottomWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("BottomWidget build ...");
    /// 获取共享的数据
    var count = CountWidget.of(context).count;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: (){
           count --;
          },
          child: Icon(Icons.remove),
        ),
        Text('$count'),
        FlatButton(
          onPressed: (){
              count ++;
          },
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
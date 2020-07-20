import 'package:flutter/material.dart';

class NotiInheritedTestPage extends StatefulWidget {
  @override
  _NotiInheritedTestPageState createState() => _NotiInheritedTestPageState();
}

class _NotiInheritedTestPageState extends State<NotiInheritedTestPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("_NotiInheritedTestPageState build");
    return CountWidget(count,child: 
      NotificationListener<MyNotification>(
        child: buildScaffold(),
        onNotification: (MyNotification noti){
          print("收到通知 noti.msg = ${noti.msg}");
          //处理通知
          if (noti.msg == "add"){
            count ++;
          }
          else {
            count --;
          }
          setState(() {
            //刷新界面
          });
          //是否拦截该通知，不向父级传道
          return true;
        },
      )
    );
  }

  Widget buildScaffold(){
    return Builder(builder: (ctx){ //ctx拿到的是CountWidget的上下文
        print("buildScaffold");
        var count = CountWidget.of(ctx).count;
        return Scaffold(
          appBar: AppBar(title: Text("事件通知demo"),),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("事件通知不是状态管理，本页面是反例"),
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

  CountWidget(this.count,{Widget child}):super(child:child);

  final int count;

  static CountWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CountWidget>();
  }

  @override
  bool updateShouldNotify(CountWidget oldWidget) {
    return count != oldWidget.count;
  }
}

/// 自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
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
            //创建一个通知， 然后分发通知
           MyNotification("sub").dispatch(context);
          },
          child: Icon(Icons.remove),
        ),
        Text('$count'),
        FlatButton(
          onPressed: (){
            //创建一个通知， 然后分发通知
            MyNotification("add").dispatch(context);
          },
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
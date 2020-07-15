import 'package:flutter/material.dart';

class STFPage extends StatefulWidget {
  @override
  _STFPageState createState() => _STFPageState();
}

class _STFPageState extends State<STFPage> {
  @override
  Widget build(BuildContext context) {
    print("_LifeCyclePageState build");
    return Scaffold(
      appBar: AppBar(title: Text("Widget与生命周期")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print("empty setState");
          });
        },
        child: Text("Empty setState"),
      ),
      body: Container(
        color: Colors.orange,
        child: Column(
          children: <Widget>[
            Text("""
1. 所有 Widget 都有 Key 属性
Local Key（局部Key）Global Key（全局Key,用的多）

2. StatelessWidget
2.1 当我们需要组合并封装多个Widget控件，且不需要维护数据状态时，可以自定义Widget并继承该类
2.2 它最大的特点是仅表示当前一帧的页面，当页面动态变化时，每次都会重建数据
2.3 内部成员变量是immutable的，通常需要使用final修饰
如果你在里面保存了变量，其实没毛用的。每次刷新创建的时候new的是新的。还是那个原始的变量。所以说用的通常都是final修饰
StatelessWidget被包裹在StatefulWidget中的时候，StatefulWidget在刷新的时候确实会new新的。

3. StatefulWidget
3.1 StatefulWidget类就会对应一个State类
3.2 三个常用的属性
3.2.1 widget 
3.2.2 context （当前widget的上下文），build方法的ctx是全局根widget的上下文。方法带的参数名可以改成ctx，可以不跟自带的上下文冲突
3.2.3 mounted  当前state是否挂载在Widget树上，在State 对象创建之后，initState() 调用之前，框架会将 State 对象加载到树中
3.4 通常的，一个单独页面的根Widget应当使用StatefulWidget 包裹，存在并需要封装动画时，也需要使用StatefulWidget封装控件。

"""),
            MySTLWidget(),
            MySTFWidget()
          ],
        ),
      ),
    );
  }
}

class MySTFWidget extends StatefulWidget {
  @override
  _MySTFWidgetState createState() => _MySTFWidgetState();
}

class _MySTFWidgetState extends State<MySTFWidget> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    print("_MySTFWidgetState build.........");
    return Container(
      color: Colors.green,
      child: Row(
        children: <Widget>[
          Text("MySTFWidget  $count"),
          Padding(padding: EdgeInsets.only(left: 20)),
          FlatButton(
              onPressed: () {
                setState(() {
                  print("FlatButton +");
                  count++;
                });
              },
              child: Text("+")),
          MySTLWidget2()
        ],
      ),
    );
  }
}

class MySTLWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MySTLWidget build.........");
    return Container(
      child: Text("MySTLWidget 这是一个提示语"),
    );
  }
}

class MySTLWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MySTLWidget2 build.........");
    return Container(
      child: Text("MySTLWidget2"),
      color: Colors.red,
    );
  }
}

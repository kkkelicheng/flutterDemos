import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  @override
  void initState() {
    super.initState();
    print("----- initState -----");
    //创建网络请求什么的
  }

//构建该Widget 表示的UI元素
  @override
  Widget build(BuildContext context) {
    print("----- Build -----");
    return Scaffold(
      appBar: AppBar(
        title: Text("LifeCyclePage"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("""
直接导致build方法触发的有2个方式，
1. didChangeDependencies()
2. didUpdateWidget()

移除的过程：
1. deactivate
2. dispose
3. done
"""),
          FlatButton(
              color: Colors.red,
              onPressed: () {
                print("flatbutton taped");
                setState(() {});
              },
              child: Text("setState"))
        ],
      ),
    );
  }

//    在initState 之后被调用，或者当State对象的依赖发生变化时调用，子类很少覆写
//    状态管理的时候会提到这个 《依赖》
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("----- didChangeDependencies -----");
  }

  @override
  void didUpdateWidget(LifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("----- didUpdateWidget -----");
  }

// 当State对象从树中被移除时，会调用此回调
// 如果移除后没有重新插入到树中则紧接着会调用dispose方法
  @override
  void deactivate() {
    print("----- deactivate -----");
    //todo before super
    super.deactivate();
  }

//当State对象从树中被永久移除时调用
//释放资源 反注册的时候
  @override
  void dispose() {
    print("----- dispose -----");
    //todo before super
    super.dispose();
  }
}

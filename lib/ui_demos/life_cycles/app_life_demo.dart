import 'package:flutter/material.dart';

class AppLifePageDemo extends StatefulWidget {
  @override
  _AppLifePageDemoState createState() => _AppLifePageDemoState();
}

//要监听系统级的App生命周期回调，
//需要在页面的State类上混入WidgetsBindingObserver类，并实现didChangeAppLifecycleState回调方法
//一般是在根页面去做
class _AppLifePageDemoState extends State<AppLifePageDemo>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    /// 注册监听器
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print("----- dispose -----");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //实现with的方法
  //一个回调，四种状态
  //切到后台， inactive  paused
  //切到前台   inactive  resumed
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("AppLifecycleState.resumed");
        break;
      case AppLifecycleState.inactive:
        print("AppLifecycleState.inactive");
        break;
      case AppLifecycleState.paused:
        print("AppLifecycleState.paused");
        break;
      case AppLifecycleState.detached:
        print("AppLifecycleState.detached");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("App 声明周期")),
      body: Container(
        child: Text("""
1. resumed 应用处于前台，可见可交互

2. inactive应用处于非活动状态。
在 iOS 上，当在通话、响应TouchID请求、进入应用切换器或控制中心时，应用会过渡到这个状态。
在Android上，当其他活动被聚焦时，例如分屏应用、电话呼叫、画中画应用、弹出系统对话框时，应用会过渡到这个状态

3. paused应用不可见，处于后台运行时处于该状态

4. detached Flutter引擎第一次初始化时正在加载视图，或在视图因Navigator.pop 而被摧毁后时，处于该状态

切到后台以后，再回来，视频中有回调didUpdateWidget，然后build。
        """),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("----- didChangeDependencies -----");
  }

  @override
  void didUpdateWidget(AppLifePageDemo oldWidget) {
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
}

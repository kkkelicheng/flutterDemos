import 'package:flutter/material.dart';
import 'package:flutterDemos/logics_demos/state_manages/provider04.dart';
import 'package:provider/provider.dart';

class PrividerBaseDemo extends StatefulWidget {
  @override
  _PrividerBaseDemoState createState() => _PrividerBaseDemoState();
}

//1. 声明数据 Model
//2. 创建共享数据
//3. 获取共享数据

///
/// 获取共享数据有几种方式
/// 2种数据，全局 和 局部
/// 全局可以跨路由访问，局部是不能跨的
/// 这里的provide其实就是封装的inheritedwidget
///
///
/// 1. 使用Provider.of<T>(context)获取指定泛型的实例对象，也就是provider，或者说是你的model
/// 2. 使用 Consumer 获取,1.要builder嵌套，2，数据个数限制。好处就是可以《《局部刷新》》
/// 3. 使用 Selector获取
/// 4. 使用扩展方法context.watch/read/select获取
/// watch和read的本质也是of
/// context.watch<T>().count 获得到了provider,读取其中的数据
/// context.read<T>().count = x 获得到了provider,去修改数据

class _PrividerBaseDemoState extends State<PrividerBaseDemo> {
  @override
  Widget build(BuildContext context) {
    print("build .... ");
    var data = Provider.of<ProviderAdvancedProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Provider简单入门")),
      body: Container(
        child: Text("当前数字 ${data.count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data.count += 1;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MySingleton {
  
  //因为Dart的默认构造函数不能被私有？？？
  //Swift都是自定义类方法的，默认的构造方法都是私有的，对外公开的方法就是获取单例

  factory MySingleton() => _getInstance();
  static MySingleton _instance;

  //私有化命名构造函数
  MySingleton._config() {
    //do something...
  }

  static MySingleton _getInstance() {
    if (_instance == null) {
      _instance = MySingleton._config();
    }
    return _instance;
  }
}

class SingletonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单例模式")),
    );
  }
}

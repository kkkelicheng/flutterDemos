import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'demo_list.dart';
import 'logics_demos/state_manages/provider02.dart';
import 'logics_demos/state_manages/provider04.dart';

void main() {
  var myCountData = ProviderAdvancedProvider();

  //全局共享数据
  //Provider是可以嵌套的，但是Provider可以使用MultiProvider避免嵌套
  runApp(ChangeNotifierProvider(
      create: (c) => ThemeProvider(),
      child: ChangeNotifierProvider.value(value: myCountData, child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
        title: 'MyFlutterDemos',
        //typedef RouteFactory = Route<dynamic> Function(RouteSettings settings);
        onGenerateRoute: (RouteSettings settings) {
          print("onGenerateRoute");
          return MaterialPageRoute(builder:(_)=>EmptyPages(),settings:settings);
        },
        theme: ThemeData(
          primarySwatch: themeProvider.primarySwitch,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DemoList());
  }
}

class EmptyPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("空页面")),
      body: Center(
        child: Text("空"),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'demo_list.dart';
import 'logics_demos/languages/demo_localizations.dart';
import 'logics_demos/languages/lang_page1.dart';
import 'logics_demos/state_manages/provider02.dart';
import 'logics_demos/state_manages/provider04.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  var myCountData = ProviderAdvancedProvider();

  //全局共享数据
  //Provider是可以嵌套的，但是Provider可以使用MultiProvider避免嵌套
  runApp(ChangeNotifierProvider(
      create: (c) => ThemeProvider(),
      child: ChangeNotifierProvider.value(
          value: myCountData, child: wrapLanguage())));
}

Widget wrapLanguage() {
  return ChangeNotifierProvider(create: (c) => LangProvider(), child: MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("MyApp build");
    var themeProvider = context.watch<ThemeProvider>();
    var langProvider = context.watch<LangProvider>();
    return MaterialApp(
        title: 'MyFlutterDemos',
        locale: langProvider.currentLang,
        //typedef RouteFactory = Route<dynamic> Function(RouteSettings settings);
        onGenerateRoute: (RouteSettings settings) {
          print("onGenerateRoute");
          return MaterialPageRoute(
              builder: (_) => EmptyPages(), settings: settings);
        },
        localizationsDelegates: [
          //生成本地化值集合的工厂
          GlobalMaterialLocalizations
              .delegate, //为Material Components库提供了本地化的字符串和其他值
          GlobalWidgetsLocalizations.delegate, //定义widget默认的文本方向，从左到右或从右到左。
          DemoLocalizationsDelegate.delegate,
        ],
        supportedLocales: [Locale('zh', 'CH'), Locale('en', 'US')],
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

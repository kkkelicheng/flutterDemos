import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../demo_list.dart';
import 'fluro_page1.dart';
import 'fluro_page2.dart';

class MyFluro {
  factory MyFluro() => _getShared();
  static MyFluro _shared;
  MyFluro._() {
    _config();
  }
  static _getShared() {
    if (_shared == null) {
      _shared = MyFluro._();
    }
    return _shared;
  }

  void _config() {
    //do some
    _registryPages();
  }

  static final Router router = Router();

  //页面ids
  static const rootPage = "/"; //首页
  static const fluro_demo1 = "/fluro_demo1";
  static const fluro_demo2 = "/fluro_demo2";

  //注册页面
  void _registryPages() {
    // router.define(routePath, handler: null)
    //typedef Widget
    //HandlerFunc(BuildContext context, Map<String, List<String>> parameters);
    router.define(rootPage,
        handler: Handler(handlerFunc: (ctx, params) => DemoList()));

    router.define(fluro_demo1,
        handler: Handler(handlerFunc: (ctx, params) => FluroPage1()));

    // List<String>> MapValue = params["pageId"]
    var fluroDemo2Handler =
        (BuildContext ctx, Map<String, List<String>> params) {
      print("fluroDemo2Handler params $params");
      return FluroPage2(int.parse(params["id"][0]));
    };
    router.define(fluro_demo2,
        handler: Handler(handlerFunc: fluroDemo2Handler));
  }

  Future navigateTo(BuildContext ctx, String path, [String param = ""]) {
    var p = param.isNotEmpty ? "$path$param" : path;
    return router.navigateTo(ctx, p, transition: TransitionType.inFromRight);
  }

  Future navigateFromBottom(BuildContext ctx, String path,
      [String param = ""]) {
    var p = param.isNotEmpty ? "$path$param" : path;
    return router.navigateTo(ctx, p, transition: TransitionType.inFromBottom);
  }
}

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class HandleFilePathPage extends StatefulWidget {
  @override
  _HandleFilePathPageState createState() => _HandleFilePathPageState();
}

class _HandleFilePathPageState extends State<HandleFilePathPage> {
  GlobalKey _gk = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _gk,
      child: Scaffold(
        appBar: AppBar(title: Text("处理路径")),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("""
使用第三方库 path_provider
该插件库支持访问两个系统文件路径
- 临时目录
- 文档目录

.packages 文件中有描述第三方库的地址
path_provider:file:///Users/emmasun/Documents/flutter/.pub-cache/hosted/pub.flutter-io.cn/path_provider-1.6.11/lib/
可以看到是放在本地了
原生的文件也是放在那里了，iOS中是生成了framework供你使用的。

"""),
              FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    saveCaptureScreen();
                  },
                  child: Text("截图保存到沙盒")),
              Text(""),
            ],
          ),
        ),
      ),
    );
  }

  void saveCaptureScreen() async {
    var path = await getPictureFilePath();
    var data = await _capture();
    File f = File(path + "/test.png");
    f.writeAsBytes(data);
  }

  Future<Uint8List> _capture() async {
    RenderRepaintBoundary boundary = _gk.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    // 获取png格式数据
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return pngBytes;
  }

  Future<String> getPictureFilePath() async {
    try {
      /// 获取临时目录
      var tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      debugPrint("tempPath is :$tempPath");

      /// 获取文档目录
      var appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      debugPrint(appDocPath);
      return tempPath;
    } catch (err) {
      print(err);
      return "";
    }
  }
}

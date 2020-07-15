import 'package:flutter/material.dart';

class ImageAssetDemoPage extends StatefulWidget {
  @override
  _ImageAssetDemoPageState createState() => _ImageAssetDemoPageState();
}

class _ImageAssetDemoPageState extends State<ImageAssetDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ImageAsset")),
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Column(
          children: <Widget>[
            Text('''
1. 图片的路径一定要对，特别是要放1.0倍下的文件，虽然现在scale都是 > 1，但是这个还是要有，0k大小也行。因为The main asset is assumed to correspond to a resolution of 1.0.
2. @2x,@3x是在flutter中当做the notion of asset variants，资源变量的概念。
3. @2x,@3x 要做成文件夹
.../image.png （1.0x 主资源默认加载的）
.../Mx/image.png （eg: /2.0x/image.png）
.../Nx/image.png
4. scale = 2 的设备，如果你指定 /image.png 只会加载2.0x/image.png，除非你指定详细的路径。
5. 如果你不指定，Image Widget的宽高，那么他会用加载的资源的尺寸 / scale，跟iOS一样的
6. 实例的路径如下，相对于pubspec.yaml
asset
  - files
  - images 
    -- logo.png
    -- 2.0x
      --- logo.png
    -- 3.0x
      ---- logo.png
7. 加载资源名字一定要写后缀，例如png，跟iOS有点区别 eg: Image(image: AssetImage("asset/images/logo_amb.png"))
'''),
            Image(image: AssetImage("asset/images/logo_amb.png"))
          ],
        )),
      ),
    );
  }
}

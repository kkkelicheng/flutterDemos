import 'package:flutter/material.dart';

class ShopHomePage extends StatefulWidget {
  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("电商首页")),
      body: _buildBody(),
    );
  }

  ///
  /// Body
  ///
  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: createGridDelegate(3),
        itemBuilder: (ctx, index) {
          return Container(
            color: Colors.green,
            child: Center(
              child: Text("$index",
                  style: TextStyle(color: Colors.white, fontSize: 23)),
            ),
          );
        });
  }

  SliverGridDelegate createGridDelegate(int columnCount) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: columnCount,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
    );
  }
}


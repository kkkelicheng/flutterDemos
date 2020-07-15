import 'package:flutter/material.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print(" _Tab2PageState init 实现了状态保存");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Tab2 Page"),
            Text("""
在每次切换Page 页时，页面都会重新创建，initState重新执行，
想要提升性能，达到我们期望的效果，则需要使用如下步骤保存状态

状态保存3步骤，
1. 在State类上混入AutomaticKeepAliveClientMixin类
2. 重写wantKeepAlive方法，并返回true
3. 在页面的build方法中，调用super.build
            """)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

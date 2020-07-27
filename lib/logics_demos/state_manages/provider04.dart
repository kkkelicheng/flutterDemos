import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderAdvancedProvider with ChangeNotifier {
  int _count = 100;
  int get count => _count;
  set count(int newCount) {
    if (newCount != _count) {
      _count = newCount;
      notifyListeners();
    }
  }

  String _name = "姓名";
  String get name => _name;
  set name(String newName) {
    if (_name != newName) {
      _name = newName;
      notifyListeners();
    }
  }
}

///页面的 ProviderAdvancedProvider 放在全局了。。。
class ProviderAdvanced extends StatefulWidget {
  @override
  _ProviderAdvancedState createState() => _ProviderAdvancedState();
}

class _ProviderAdvancedState extends State<ProviderAdvanced> {
  @override
  Widget build(BuildContext context) {
    //假如在这里使用context拿到了Provider
    //那么刷新的时候就会调用这个context的中state中的setState
    //如何在局部进行用Provider，类似于Consumer那种的
    //答案就是在局部的builder中进行使用provider

    return Scaffold(
      appBar: AppBar(title: Text("Provider进阶")),
      body: _buildBody(),
      floatingActionButton: _buildFloatBtn(),
    );
  }

  Widget _buildFloatBtn() {
    print("_buildFloatBtn");
    return FloatingActionButton(
        child: Icon(Icons.add), onPressed: _changeCountAction);
  }

  Widget _buildBody() {
    print("_buildBody ...");
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildText(),
          _buildText2(),
          _buildText3(),
          _buildText4(),
          RaisedButton(onPressed: _changeNameAction, child: Text("change name"))
        ],
      ),
    );
  }

  Widget _buildText() {
    return Builder(builder: (ctx) {
      print("_buildText ...");
      var data = Provider.of<ProviderAdvancedProvider>(ctx);
      return Text("${data.count}");
    });
  }

//验证一下of 和 watch 是不是一回事
  Widget _buildText2() {
    return Builder(builder: (ctx) {
      print("_buildText2 ...");
      var data = ctx.watch<ProviderAdvancedProvider>();
      return Text("-copied- ${data.count}");
    });
  }

  void _changeNameAction() {
    var p = context.read<ProviderAdvancedProvider>();
    //使用read 可以让 widget tree rebuild when the obtained value changes.
    //而watch不行，所以让read改变数据
    p.name = "姓名" + "${p.count}";
    //这里_buildText 1 ，2 ，3 ，4都会重新创建
  }

  void _changeCountAction() {
    context.read<ProviderAdvancedProvider>().count += 1;
    //这里_buildText 1 ，2 ，3 会重新创建 但是4不会，因为4是selector进行了筛选
  }

  Widget _buildText3() {
    return Builder(builder: (ctx) {
      print("_buildText3 name ...");
      var data = ctx.watch<ProviderAdvancedProvider>();
      return Text("${data.name}");
    });
  }

  Widget _buildText4() {
    //Selector用法跟Comsume差不多,Selector是SingleChildStatefulWidget类型的
    //过滤掉不需要的数据通知
    return Selector<ProviderAdvancedProvider, String>(
        builder: (BuildContext context, String value, Widget child) {
      print("_buildText4 build selector");
      return Container(
        color: Colors.red,
        child: Text("$value"),
      );
    }, selector: (ctx, model) {
      return model.name;
    });
  }
}

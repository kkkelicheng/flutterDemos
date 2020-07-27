import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeListItem {
  String name = "";
  int age = 10;
  int index = 0;

  static Future<List<HomeListItem>> createItems() async {
    List<HomeListItem> container = [];
    for (int i = 0; i < 100; i++) {
      var instanceOne = HomeListItem();
      instanceOne.index = i;
      instanceOne.name = "name $i";
      container.add(instanceOne);
    }
    return Future.delayed(Duration(milliseconds: 3000), () => container);
  }
}

class HomeProvider with ChangeNotifier {
  List<HomeListItem> _items = List<HomeListItem>();
  List<HomeListItem> get items => UnmodifiableListView(_items);
  //数据加载状态
  Completer<bool> _isInit = Completer();
  Future<bool> get isInit => _isInit.future;

  HomeProvider() {
    _init();
  }

  void _init() async {
    List<HomeListItem> results = await loadNetwork();
    _items = results;
    _isInit.complete(true);
    notifyListeners();
  }

//外界调用,下啦刷新
  void header_refresh() async {
    List<HomeListItem> results = await loadNetwork();
    _items = results;
    //当获取到数据后，通知外面数据已经刷新
    notifyListeners();
  }

  Future<List<HomeListItem>> loadNetwork() async {
    List<HomeListItem> results = await HomeListItem.createItems();
    return results;
  }
}

///
///
///上面都是数据处理
///
///
///

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    //初始化的时候进行网络请求。
    _homeProvider = HomeProvider();
  }

  @override
  Widget build(BuildContext context) {
    //这里使用value 命名构造还是 用create的构造呢。。
    //当你有了ChangeNotifier的实例以后，就可以使用value这个构造方法，就不用lazy去创建了
    return ChangeNotifierProvider.value(
        value: _homeProvider,
        child: Scaffold(
          appBar: AppBar(title: Text("Provider 局部刷新应用")),
          body: SafeArea(
              child: Container(
            color: Color(0xfff5f6f7),
            child: _buildBody(),
          )),
        ));
  }

  Widget _buildBody() {
    return FutureBuilder(
        initialData: false,
        future: _homeProvider.isInit,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          print("snapshot data : ${snapshot.data}");
          switch (snapshot.connectionState) {
            //未加载完成前
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              //数据加载完成
              if (snapshot.data) return _buildList();
          }
          return Container();
        });
  }

  Widget _buildList() {
    //这里不能直接用context，因为这个context是_HomePageState的，里面鸭羹就没有ChangeNotifierProvider的上下文
    return Builder(builder: (ctx) {
      var data = ctx.watch<HomeProvider>().items;
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (listCtx, index) {
            String name = data[index].name;
            print("name : $name");
            return ListTile(
              title: Text(name),
            );
          });
    });
  }
}

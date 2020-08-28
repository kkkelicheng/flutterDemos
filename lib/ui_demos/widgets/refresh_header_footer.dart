import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshHeaderFooter extends StatefulWidget {
  @override
  _RefreshHeaderFooterState createState() => _RefreshHeaderFooterState();
}

class _RefreshHeaderFooterState extends State<RefreshHeaderFooter> {
  RefreshController _refreshController;
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("自定义pull_to_refresh")),
      body: createContent(),
    );
  }

  Widget createContent() {
    return SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        footer: CustomFooter(builder: _builderFooter),
        header: CustomHeader(builder: _goodDetailHeader),
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ));
  }

  void _onRefresh() async {
    print("_onRefresh");
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("_onLoading");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  Widget _builderFooter(BuildContext context, LoadStatus mode) {
    Widget body;
    if (mode == LoadStatus.idle) {
      body = Text("pull up load");
    } else if (mode == LoadStatus.loading) {
      body = CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = Text("Load Failed!Click retry!");
    } else if (mode == LoadStatus.canLoading) {
      body = Text("release to load more");
    } else {
      body = Text("No more Data");
    }
    return Container(
      color: Colors.red,
      height: 55.0,
      child: Center(child: body),
    );
  }

  Widget _buildHeader(BuildContext context, RefreshStatus mode) {
    return Center(
        child: Text(mode == RefreshStatus.idle
            ? "下拉刷新"
            : mode == RefreshStatus.refreshing
                ? "刷新中..."
                : mode == RefreshStatus.canRefresh
                    ? "可以松手了!"
                    : mode == RefreshStatus.completed ? "刷新成功!" : "刷新失败"));
  }

  Widget _goodDetailHeader(BuildContext ctx, RefreshStatus model) {
    String content = "下拉，返回商品基本信息";
    String assetName = "asset/svgs/circle-arrow-down.svg";
    if (model == RefreshStatus.canRefresh ||
        model == RefreshStatus.refreshing ||
        model == RefreshStatus.completed) {
      content = "释放，返回商品基本信息";
      assetName = "asset/svgs/circle-arrow-up.svg";
    }

    return Column(children: <Widget>[
      SvgPicture.asset(
        assetName,
        width: 15,
        height: 15,
        color: Colors.blue,
      ),
      SizedBox(height: 9),
      Text("$content")
    ]);
  }
}

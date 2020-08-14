import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/filers_ui/tab_filter_models.dart';

class MainFilterBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onFilterAction,
      child: Container(
        color: Colors.blue,
        width: 90,
        child: Center(
          child: Row(
            children: <Widget>[Text("筛选"), Icon(Icons.filter_list)],
          ),
        ),
      ),
    );
  }

  _onFilterAction() {
    print("展开右边的drawer");
  }
}

class FilterTabDemo extends StatefulWidget {
  @override
  _FilterTabDemoState createState() => _FilterTabDemoState();
}

class _FilterTabDemoState extends State<FilterTabDemo>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("筛选条件"),
        bottom: FilterTabs(),
      ),
    );
  }
}

class FilterTabs extends StatefulWidget implements PreferredSizeWidget {
  @override
  _FilterTabsState createState() => _FilterTabsState();

  @override
  Size get preferredSize => Size.fromHeight(49);
}

class _FilterTabsState extends State<FilterTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  FilterDatas _filterDatas;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _filterDatas = tabModels();
  }

  @override
  Widget build(BuildContext context) {
    print("FilterTabs builder");
    return Container(
      height: 49,
      color: Colors.yellow.withAlpha(111),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Container(color: Colors.blue, child: createItems())),
          // Container(width: 200, color: Colors.blue, child: createItems()),
          MainFilterBtn()
        ],
      ),
    );
  }

  Widget createItems() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorWeight: 4,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: _filterDatas.models
            .map((e) => FilterTabItems(e.currentShowStatus))
            .toList(),
        indicatorColor: Colors.red,
        onTap: (index) {
          print("$index");
          _filterDatas.setSelectIndex(index);
          setState(() {});
        });
  }

  //销量
  FilterTabModel tabModel_sale() {
    var normal = FilterTabStatusModel(id: 1, desc: "销量");
    var select =
        FilterTabStatusModel(id: 11, desc: "销量", titleColor: Colors.red);
    return FilterTabModel(defaultStatus: normal, selectStatus: [select]);
  }

  FilterTabModel tabModel_credit() {
    var normal = FilterTabStatusModel(id: 2, desc: "信用");
    var select =
        FilterTabStatusModel(id: 22, desc: "信用", titleColor: Colors.red);
    return FilterTabModel(defaultStatus: normal, selectStatus: [select]);
  }

  FilterTabModel tabModel_price() {
    var normal =
        FilterTabStatusModel(id: 3, desc: "销量", imageName: "sort_none.png");
    var select1 = FilterTabStatusModel(
        id: 30, desc: "销量", titleColor: Colors.red, imageName: "sort_down.png");
    var select2 = FilterTabStatusModel(
        id: 31, desc: "销量", titleColor: Colors.red, imageName: "sort_up.png");

    return FilterTabModel(
        defaultStatus: normal, selectStatus: [select1, select2]);
  }

  FilterDatas tabModels() {
    return FilterDatas(
        models: [tabModel_sale(), tabModel_credit(), tabModel_price()]);
  }
}

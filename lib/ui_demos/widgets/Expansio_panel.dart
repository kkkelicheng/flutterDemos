import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class ItemData {
  ItemData(this.index, this.isExpanded);

  int index;
  bool isExpanded;
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ItemData> dataList;

  @override
  void initState() {
    super.initState();
    dataList = List.generate(5, (i) {
      return ItemData(i, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //为什么这里要包裹SingleChildScrollView？ 官方是这样的。。。
        //You probably want to put the RenderListBody
        // inside a RenderViewport with a matching main axis.
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                dataList[index].isExpanded = !isExpanded;
              });
            },
            children: dataList.map((value) {
              return this.createItem(value);
            }).toList(),
          ),
        ),
      ),
    );
  }

  ExpansionPanel createItem(ItemData value) {
    return ExpansionPanel(
      isExpanded: value.isExpanded,
      //点击header能不能展开，否则只能通过点击右边的箭头了
      canTapOnHeader: true,
      headerBuilder: (context, isExpanded) {
        return Container(
          color: isExpanded ? Colors.red : Colors.white,
          child: ListTile(
            title: Text('子项 - ${value.index} - Header在此'),
            trailing: Icon(Icons.arrow_back_ios),
          ),
        );
      },
      //https://material.io/components/lists#anatomy
      //这个右边不能改，就是这么设计的。。。
      //This widget is visible only when the panel is expanded
      //body就是在展开的时候可见的。
      body: Container(
        alignment: Alignment.center,
        height: 80,
        color: Colors.grey[200],
        child: Text("body就是在展开的时候可见的"),
      ),
    );
  }
}

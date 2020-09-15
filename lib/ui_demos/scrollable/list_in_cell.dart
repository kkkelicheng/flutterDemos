import 'package:flutter/material.dart';

class ListInCell extends StatefulWidget {
  @override
  _ListInCellState createState() => _ListInCellState();
}

class _ListInCellState extends State<ListInCell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List在cell中")),
      body: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return index % 2 == 0
                    ? cell(index)
                    : Container(height: 10, color: Colors.grey);
              })),
    );
  }

  Widget cell(int count) {
    return Container(
      color: Colors.yellow,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: count,
          itemBuilder: (ctx, index) {
            return ListTile(title: Text("index $index"));
          }),
    );
  }
}

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("确认订单")),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (ctx, index) {
              return BoxPaddingWraper(child: ConfirmOrderCell());
            }),
      ),
    );
  }
}

class BoxPaddingWraper extends StatelessWidget {
  final Widget child;
  BoxPaddingWraper({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      width: double.infinity,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ConfirmOrderCell extends StatefulWidget {
  @override
  _ConfirmOrderCellState createState() => _ConfirmOrderCellState();
}

class _ConfirmOrderCellState extends State<ConfirmOrderCell> {
  @override
  Widget build(BuildContext context) {
    return BoxPaddingWraper(child: goodListItem());
  }

  Widget goodListItem() {
    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       cellHeader(),
    //       createGoods(),
    //       cellFooter(),
    //     ],
    //   ),
    // );

    return Column(
      children: <Widget>[
        cellHeader(),
        createGoods(),
        cellFooter(),
      ],
    );
  }

  Widget createGoods() {
    int goodCount = 3;
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: goodCount,
        itemBuilder: (ctx, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              goodTitleImage(),
              Divider(height: 0.5),
              goodProperties(),
              Divider(height: 0.5),
            ],
          );
        });
  }

  Widget cellHeader() {
    return Container(
        height: 48,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 12),
                  Container(width: 24, height: 24, color: Colors.red),
                  SizedBox(width: 8),
                  Text("广州宝钢南方贸易有限公司")
                ])));
  }

  Widget goodTitleImage() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(width: 64, height: 64, color: Colors.red),
          SizedBox(width: 8),
          Expanded(
            child: Text("三级抗震螺纹钢 HRB400E 25*12 三纲,三级抗震螺纹钢 HRB400E 25*12 三纲",
                maxLines: 100),
          )
        ],
      ),
    );
  }

  Widget goodProperties() {
    int count = 3;
    List<Widget> properties = [];
    for (var i = 0; i < count; i++) {
      properties.add(oneProperty());
      if (i != count - 1) {
        properties.add(Container(height: 8));
      }
    }
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(children: properties),
    );
  }

  Widget oneProperty() {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.grey,
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("松石绿/4核J3160 4G 120SSD"),
                SizedBox(height: 8),
                Text("单价：79.00/件 x100")
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget cellFooter() {
    return Column(
      children: <Widget>[footer_address(), footer_separetor(), footer_sum()],
    );
  }

  Widget footer_address() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text("xxx"),
            SizedBox(width: 16),
            Text("185 2929 6758"),
            SizedBox(width: 16),
            Text("自提地址")
          ]),
          SizedBox(height: 8),
          Text("广东省广州市海珠区新港东路中州中心北塔,广东省广州市海珠区新港东路中州中心北塔,广东省广州市海珠区新港东路中州中心北塔")
        ],
      ),
    );
  }

  Widget footer_separetor() {
    return Container(
      height: 12,
      color: Colors.red,
    );
  }

  Widget footer_sum() {
    return Container(
        padding: EdgeInsets.fromLTRB(12, 6, 12, 12),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text("运费"), Text("¥10.00")],
            ),
            SizedBox(height: 8),
            Row(children: <Widget>[
              Text("商品总额"),
              Expanded(child: Container()),
              Text("共2种200件"),
              SizedBox(width: 10),
              Text("¥850.00"),
            ])
          ],
        ));
  }
}

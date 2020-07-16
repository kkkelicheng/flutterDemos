import 'package:flutter/material.dart';

class SingleChildSVDemo extends StatefulWidget {
  @override
  _SingleChildSVDemoState createState() => _SingleChildSVDemoState();
}

class _SingleChildSVDemoState extends State<SingleChildSVDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("单个子元素的滚动包裹")),
        body: Container(
          margin: EdgeInsets.only(top: 100),
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Column(
              children: createColumeList(),
            ),
          ),
        ));
  }

  List<Widget> createColumeList() {
    return [
      Text("""
      据介绍，2020年全国夏粮播种面积26172千公顷，比2019年减少181.6千公顷，下降0.7%。
      其中小麦播种面积22711千公顷，比2019年减少273.5千公顷，下降1.2%。

　　夏粮播种面积减少主要有两大原因：
一是农业供给侧结构性改革进一步深入，
秋冬播种植结构调整优化。
受市场需求和种植效益等因素影响，
一些夏粮主产区主动扩种蔬菜、油菜籽等经济作物，
适当调减小麦播种面积。二是华北平原地下水超采区季节性休耕制度推广实施，
相关地区主动调减小麦播种面积。
为进一步提高耕地质量，推进藏粮于地战略的实施，
近年来我国在华北平原一些地区将季节性休耕制度与地下水超采综合治理相结合，
实行“一季休耕、一季种植”种植模式。比如河北省在地下水超采区廊坊、
保定、邯郸和雄安新区等47个县（市）组织实施季节性休耕限采措施，冬小麦播种面积减少较多。

　　尽管2020年夏粮播种面积略减，但单产提高支撑了夏粮实现丰收增产。
据介绍，今年全国夏粮单位面积产量5456.5公斤/公顷，比2019年增加83.4公斤/公顷，增长1.6%。
其中小麦单位面积产量5798.0公斤/公顷，比2019年增加101.9公斤/公顷，增长1.8%。
      """),
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      ClipOval(
        child: Container(
          width: 150,
          height: 150,
          color: Colors.blue,
        ),
      )
    ];
  }
}

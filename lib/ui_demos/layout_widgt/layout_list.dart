
import 'package:flutter/material.dart';
import 'wrap_02.dart';
import 'flex_01.dart';

class LayoutList extends StatelessWidget {
  final List<String> demosTitles = ["Flex","Wrap","IndexedStack"];
  static const routeName = "UIList";
  static final routeSettings = RouteSettings(name:LayoutList.routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: createList(),
      ),
      appBar:AppBar(title:Text("Widget List"))
    );
  }

  Widget createList(){
    return  ListView.separated(itemBuilder: (ctx,index){
        return InkWell(
                onTap: (){
                  listTapedIndex(ctx, index);
                },
                child: ListTile(
                    title:Text(demosTitles[index]),
                    trailing: Icon(Icons.arrow_right),
                ),
              );
      }, separatorBuilder: (ctx,index){
        return Divider();
      }, itemCount: demosTitles.length);
  }

  void listTapedIndex(ctx,index){
    if (index == 0) {
      var page = FlexPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    if (index == 1) {
      var page = WrapPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}
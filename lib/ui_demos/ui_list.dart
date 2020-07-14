
import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/router_examples/first_page.dart';

import 'layout_widgt/layout_list.dart';

class UIList extends StatelessWidget {
  final List<String> demosTitles = ["生命周期","路由","LayoutList"];
  static const routeName = "UIList";
  static final routeSettings = RouteSettings(name:UIList.routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: createList(),
      ),
      appBar:AppBar(title:Text("UIList"))
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
    if (index == 1) {
      var page = FirstPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
    else if (index == 2){
      var page = LayoutList();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/widgets/tab_views.dart';

class RootsWidgets extends StatelessWidget {
  final List<String> demosTitles = ["tab_tabViews","tab_PageView"];

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
     if (index == 0) {
      var page = TabViewPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

  }
}
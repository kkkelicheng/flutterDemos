import 'package:flutter/material.dart';
import 'package:flutterDemos/ui_demos/ui_list.dart';

class DemoList extends StatelessWidget {
  final List<String> demosTitles = ["UI_s","Logic","Interaction"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: createList(),
      ),
      appBar:AppBar(title:Text("DemoList"))
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
    switch (index) {
      case 0:
          Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (context) => UIList(),
              settings: UIList.routeSettings
            ),
          );
        break;
      default:
        break;
    }
  }
}
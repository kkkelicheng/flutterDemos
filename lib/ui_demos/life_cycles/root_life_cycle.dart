
import 'package:flutter/material.dart';

import 'app_life_demo.dart';
import 'life_cycles_demo.dart';
import 'life_cycles_demo2.dart';

class RootsLifeWidgets extends StatelessWidget {
  final List<String> demosTitles = 
  ["StatelessWidget & StatefulWidget",
  "StatefulWidget 生命周期",
  "App状态监听"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: createList(),
      ),
      appBar:AppBar(title:Text("生命周期demos"))
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
      var page = STFPage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 1) {
      var page = LifeCyclePage();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }

    if (index == 2) {
      var page = AppLifePageDemo();
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}
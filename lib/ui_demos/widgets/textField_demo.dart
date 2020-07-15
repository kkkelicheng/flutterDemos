import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDemos extends StatefulWidget {
  @override
  _TextFieldDemosState createState() => _TextFieldDemosState();
}

class _TextFieldDemosState extends State<TextFieldDemos> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFieldDemos Demo")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('''
TextField
border 这个属性有点意思，能跟button一样，有不同状态的style,disable,enable
BorderSize这个对象是用来描述边框的。color,width,style,
有时候这个边框玩起来很累的，外面包一个container，再设置Decoration玩玩就好了。
因为有些控件的特性很奇葩，你懂的。除非有那些需求就直接用。
不得不说在限制相关的功能，这些UI库比原生的方便很多。
有个奇葩的地方
prefixIcon,Widget,不论是否获得焦点，都显示
prefix,prefixText这2个Widget,会在获得焦点的时候，或者有内容的时候显示
            '''),
            Row(children: <Widget>[
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    ///黑名单校验
                    BlacklistingTextInputFormatter(RegExp("[a-z]")),
                    //长度限制
                    LengthLimitingTextInputFormatter(11),
                    // 白名单校验
                    WhitelistingTextInputFormatter(RegExp("[0-9]"))
                  ],
                  textInputAction: TextInputAction.search, //键盘的按钮
                  controller: myController,
                  onChanged: (value) {
                    print("onchanged" + value);
                  },
                  keyboardType: TextInputType.emailAddress, //数字键盘
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      // prefixText: "区号",
                      prefixIcon: Icon(Icons.phone_iphone),
                      enabled: true,
                      //这里也有prefix Widget
                      hintText: "请输入一些东西",
                      hintStyle: TextStyle(color: Colors.cyan),
                      // filled: true,
                      border: InputBorder.none,
                      // suffixIcon: Icon(Icons.add_alert),
                      // fillColor: Colors.blueGrey,
                      suffix: Text("suffix only"),
                      // suffixText: "okk??",
                      suffixIcon: Icon(
                        Icons.ac_unit,
                        color: Colors.cyan,
                      )),
                ),
              ),
              SizedBox(width: 10),
            ]),
            TextField(
              keyboardType: TextInputType.phone,
              maxLines: 1,
              maxLength: 30,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_iphone),
                  hintText: "请输入手机号",
                  contentPadding: EdgeInsets.symmetric(vertical: 10)),
            ),
          ],
        ),
      ),
    );
  }
}

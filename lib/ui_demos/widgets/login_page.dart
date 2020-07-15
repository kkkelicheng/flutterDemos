import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("loginPage"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          CurveBgWidget(
            color: const Color(0xfff5f6f7),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 120),
            child: IrregularContainer(
              color: Colors.white,
              circleRadius: 50,
              borderRadius: 8,
              circleTopOffset: 30,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 12, bottom: 12),
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pinkAccent,
                          )),
                      Text(
                        '登录',
                        style:
                            TextStyle(color: Color(0xff333333), fontSize: 24),
                      )
                    ],
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneNum,
                    maxLines: 1,
                    maxLength: 30,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_iphone),
                        hintText: "请输入手机号",
                        contentPadding: EdgeInsets.symmetric(vertical: 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: TextField(
                      controller: _password,
                      maxLines: 1,
                      maxLength: 32,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "请输入登录密码",
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          )),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '忘记密码?',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        )
                      ]),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 12),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        '登录',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0xFFEA3D87),
                            const Color(0xFFFF7095)
                          ]),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1.0, 5.0),
                              color: Color.fromRGBO(234, 61, 135, 0.4),
                              blurRadius: 5.0,
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('验证码登录',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff333333))),
                        Container(
                            height: 12,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: VerticalDivider(
                              width: 0.0,
                              color: Color(0xFFDEDEDE),
                              thickness: 1,
                            )),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            '新用户注册',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF02A9FF)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: true,
                        onChanged: (v) {},
                      ),
                      Text.rich(TextSpan(
                          text: '我已阅读并同意遵守',
                          style: TextStyle(
                              fontSize: 16, color: const Color(0xff999999)),
                          children: [
                            TextSpan(
                              text: '《服务许可协议》',
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xff333333)),
                            ),
                          ])),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

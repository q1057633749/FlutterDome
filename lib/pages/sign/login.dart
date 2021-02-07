import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/provider/appState.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context
        .read<AppStateData>()
        .setStatusBarHeight(MediaQuery.of(context).padding.top);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/sign/login.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                  height: context.watch<AppStateData>().double_statusBarHeight),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(
                  'images/sign/logo.png',
                  width: 88,
                  height: 88,
                ),
              ),
              Container(
                width: 334.0,
                padding: EdgeInsets.fromLTRB(37, 33, 37, 33),
                margin: EdgeInsets.fromLTRB(22, 30, 22, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(14, 29, 118, 0.18),
                          offset: Offset(2.5, 0),
                          blurRadius: 21.5)
                    ]),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        '登录',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 30.0),
                        padding: EdgeInsets.fromLTRB(6.0, 16.0, 16.0, 16.0),
                        alignment: Alignment.centerLeft,
                        height: 53.0,
                        decoration: BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Image.asset('images/sign/user.png',
                                    width: 20.0, height: 20.0),
                                isCollapsed: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00FF0000)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                hintText: '请输入手机号',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000000)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                labelStyle:
                                    Theme.of(context).textTheme.headline4),
                            style: Theme.of(context).textTheme.headline5)),
                    Container(
                        margin: EdgeInsets.only(top: 20.5),
                        padding: EdgeInsets.fromLTRB(6.0, 16.0, 16.0, 16.0),
                        alignment: Alignment.centerLeft,
                        height: 53.0,
                        decoration: BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Image.asset('images/sign/lock.png',
                                    width: 20.0, height: 20.0),
                                isCollapsed: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00FF0000)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                hintText: '请输入密码',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000000)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                labelStyle:
                                    Theme.of(context).textTheme.headline4),
                            style: Theme.of(context).textTheme.headline5)),
                    Container(
                      margin: EdgeInsets.only(top: 12.5),
                      padding: EdgeInsets.only(right: 6),
                      child: Text(
                        '忘记密码',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hoverColor
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 45,
                      decoration: BoxDecoration(
                          gradient:LinearGradient(colors: [Color.fromRGBO(254, 177, 97, 1),Color.fromRGBO( 253, 108, 48, 1)]),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child:ButtonTheme(
                        splashColor:Color.fromRGBO(254, 177, 120, 1),
                        child:RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            color: Colors.transparent,
                            elevation: 0, // 正常时阴影隐藏
                            highlightElevation: 0, // 点击时阴影隐藏
                            onPressed: (){},
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text('登 录', style: TextStyle(color: Colors.white, fontSize: 20),),
                            )
                        )
                      ) ,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

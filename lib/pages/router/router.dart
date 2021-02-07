import 'package:flutter/material.dart';
import '../tabs.dart';
import '../tabbar/home.dart';
import '../tabbar/my.dart';
import '../tabbar/dynameic.dart';
import '../tabbar/live.dart';
import '../sign/login.dart';

final routes={
    '/':(context,{arguments})=>LoginPage(),
    '/HomePage':(context,{arguments})=>HomePage(),
    '/DynameicPage':(context,{arguments})=>DynameicPage(),
    '/LivePage':(context,{arguments})=>LivePage(),
    '/MyPage':(context,{arguments})=>MyPage()
};

var onGenerateRoute = (RouteSettings settings){
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuildr = routes[name];
  if(pageContentBuildr != null){
    if(settings.arguments != null){
      final Route route = MaterialPageRoute(builder: (context)=>pageContentBuildr(context,arguments:settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(builder: (context)=>pageContentBuildr(context));
      return route;
    }
  }
};
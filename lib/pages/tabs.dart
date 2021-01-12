import 'package:flutter/material.dart';
import 'package:flutterapp/pages/tabbar/dynameic.dart';
import 'package:flutterapp/pages/tabbar/home.dart';
import 'package:flutterapp/pages/tabbar/live.dart';
import 'package:flutterapp/pages/tabbar/my.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _currentIndex = 0;
  List _tabbarList=[
    HomePage(),
    DynameicPage(),
    LivePage(),
    MyPage()
  ];
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutterDome'),
      ),
      body:_tabbarList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(title: Text('首页'),icon: Image.asset('images/home.png')),
          BottomNavigationBarItem(title: Text('直播'),icon: Image.asset('images/live.png')),
          BottomNavigationBarItem(title: Text('动态'),icon: Image.asset('images/dynameic.png')),
          BottomNavigationBarItem(title: Text('我的'),icon: Image.asset('images/my.png'))
        ],
      ),
    );
  }
}

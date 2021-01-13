import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutterapp/pages/tabbar/dynameic.dart';
import 'package:flutterapp/pages/tabbar/home.dart';
import 'package:flutterapp/pages/tabbar/live.dart';
import 'package:flutterapp/pages/tabbar/my.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  AnimationController _controller;
  double bottomWidth = 25.0;
  double bottomHeight = 25.0;
  double isBtmWidth = 80.0;
  double isBtmHeight = 80.0;
  int _currentIndex = 0;
  int lastTime = 0;
  List _tabbarList = [HomePage(), DynameicPage(), null, LivePage(), MyPage()];
  List<Widget> _tabList = [HomePage(), DynameicPage(), LivePage(), MyPage()];
  int page = 0;
  PageController pageController;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    pageController = PageController(initialPage: page);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;
          if (result > 1000) {
            Fluttertoast.showToast(
                msg: "再次返回退出",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blueGrey,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            SystemNavigator.pop();
          }
          return null;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text('flutterDome'),
            ),
            body: PageView(
              children: _tabList,
              onPageChanged: onPageChanged,
              controller: pageController,
            ),
            floatingActionButton: Container(
              width: 80.0,
              height: 80.0,
              padding: EdgeInsets.all(8),
//              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45), color: Colors.white),
              child: FloatingActionButton(
                foregroundColor: Colors.amberAccent,
                backgroundColor: Color(0xFF7C4DF9),
                child: ClipOval(
                    child: Image.asset('images/main_start.png',
                        width: 100.0, height: 100.0)),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BtnBarStyle1()));
  }

  void onPageChanged(int value) {
    if (value > 1) value += 1;
    setState(() {
      print(pageController);
      this._currentIndex = value;
    });
  }

  Widget BtnBarStyle1() {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  onTap(0);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                        widthFactor: _currentIndex == 0 ? 0.3 : 1,
                        heightFactor: _currentIndex == 0 ? 0.2 : 1,
                        alignment: _currentIndex == 0
                            ? Alignment(0.0, 0.6)
                            : Alignment(0.0, 0.0),
                        child: Image.asset(
                            _currentIndex == 0
                                ? 'images/is_home.png'
                                : 'images/home.png',
                            width:
                                _currentIndex == 0 ? isBtmWidth : bottomWidth,
                            height: _currentIndex == 0
                                ? isBtmHeight
                                : bottomHeight)),
                    Text("首页",
                        style: TextStyle(
                            color: _currentIndex == 0
                                ? Color(0xFF7C4DF9)
                                : Color(0xFF999999)))
                  ],
                )),
            GestureDetector(
                onTap: () {
                  onTap(1);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('images/home.png',
                        width: bottomWidth, height: bottomHeight),
                    Text("首页", style: TextStyle(color: Color(0xFF999999)))
                  ],
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home, color: Colors.transparent),
//                Text("首页", style: TextStyle(color: Color(0xFF999999)))
              ],
            ),
            GestureDetector(
                onTap: () {
                  onTap(3);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('images/home.png',
                        width: bottomWidth, height: bottomHeight),
                    Text("首页", style: TextStyle(color: Color(0xFF999999)))
                  ],
                )),
            GestureDetector(
                onTap: () {
                  onTap(4);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('images/home.png',
                        width: bottomWidth, height: bottomHeight),
                    Text("首页", style: TextStyle(color: Color(0xFF999999)))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget BtnBarStyle2() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF7C4DF9),
      unselectedItemColor: Color(0xFF999999),
      backgroundColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (int index) => {
        if (_currentIndex != index && index != 2)
          {
            print(pageController),
            onTap(index),
            setState(() {
              _currentIndex = index;
            })
          },
      },
      items: [
        BottomNavigationBarItem(
            title: Text('首页'),
            icon: Image.asset('images/home.png',
                width: bottomWidth, height: bottomHeight),
            activeIcon: Align(
              widthFactor: 0.5,
              heightFactor: 0.2,
              alignment: Alignment(0.0, 0.6),
              child: Image.asset('images/is_home.png',
                  height: isBtmWidth, width: isBtmHeight),
            )),
        BottomNavigationBarItem(
            title: Text('直播'),
            icon: Image.asset('images/live.png',
                width: bottomWidth, height: bottomHeight),
            activeIcon: Align(
              widthFactor: 0.5,
              heightFactor: 0.2,
              alignment: Alignment(0.0, 0.6),
              child: Image.asset('images/is_live.png',
                  height: isBtmWidth, width: isBtmHeight),
            )),
        BottomNavigationBarItem(
            title: Text(''),
            icon: Image.asset('images/dynameic.png',
                width: bottomWidth, height: bottomHeight)),
        BottomNavigationBarItem(
            title: Text('动态'),
            icon: Image.asset('images/dynameic.png',
                width: bottomWidth, height: bottomHeight),
            activeIcon: Align(
              widthFactor: 0.5,
              heightFactor: 0.2,
              alignment: Alignment(0.0, 0.6),
              child: Image.asset('images/is_dynameic.png',
                  height: isBtmWidth, width: isBtmHeight),
            )),
        BottomNavigationBarItem(
          title: Text('我的'),
          icon: Image.asset('images/my.png',
              width: bottomWidth, height: bottomHeight),
          activeIcon: Align(
              widthFactor: 0.5,
              heightFactor: 0.2,
              alignment: Alignment(0.0, 0.6),
              child: Image.asset('images/is_my.png',
                  height: isBtmWidth, width: isBtmHeight)),
        )
      ],
    );
  }

  void onTap(int value) {
    if (value > 1) value -= 1;
    pageController.jumpToPage(value);
  }
}

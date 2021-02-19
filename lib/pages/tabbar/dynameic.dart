import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/provider/appState.dart';

class DynameicPage extends StatefulWidget {
  @override
  DynameicPageState createState() => new DynameicPageState();
}

class DynameicPageState extends State<DynameicPage>
    with TickerProviderStateMixin {
  var isTabs = 0;

  AnimationController _controller;

  TextStyle onSelect = TextStyle(
      fontSize: Adapt.px(20.0),
      color: Color.fromRGBO(153, 153, 153, 1),
      fontWeight: FontWeight.bold);

  TextStyle isSelect = TextStyle(
      fontSize: Adapt.px(22.0),
      color: Color.fromRGBO(0, 0, 0, 1),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return DynameicMain(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(DynameicPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget DynameicMain(BuildContext context) {
    List tabsArr = ['推荐', '关注', '最新'];

    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: context.watch<AppStateData>().double_statusBarHeight,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: tabList(tabsArr),
                          ),
                          Container(
                            width: Adapt.px(290.0),
                            height: 22.0,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 2.0),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  top: 0,
                                  left: Adapt.px(
                                      20.0 * (isTabs + 1) + 34 * isTabs + 11),
                                  duration: Duration(milliseconds: 300),
                                  child: Image.asset(
                                    'images/dynameic/botline.png',
                                    width: 16.0,
                                    height: 7.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0,right: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Image.asset('images/dynameic/dynameic.png',
                                width: Adapt.px(22.0), height: Adapt.px(22.0)),
                          ),
                          InkWell(
                            child: Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Image.asset(
                                  'images/dynameic/message.png',
                                  width: Adapt.px(22.0),
                                  height: Adapt.px(22.0),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
//          ListView(
//            children: [
//              Text('123')
//            ],
//          ),
      ],
    ));
  }

  List<Widget> tabList(tabsArr) {
    List<Widget> _tabs = new List();
    for (var i = 0; i < tabsArr.length; i++) {
      _tabs.add(Container(
        margin: EdgeInsets.only(left: 20.0),
        child: InkWell(
          onTap: () => {
            setState(() => {isTabs = i}),
            _controller.forward(),
            print(isTabs)
          },
          child: Text(
            tabsArr[i],
            style: isTabs == i ? isSelect : onSelect,
          ),
        ),
      ));
    }

    return _tabs;
  }
}

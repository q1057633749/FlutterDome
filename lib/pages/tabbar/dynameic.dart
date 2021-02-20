import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutterapp/provider/appState.dart';

class DynameicPage extends StatefulWidget {
  @override
  DynameicPageState createState() => new DynameicPageState();
}

class DynameicPageState extends State<DynameicPage>
    with TickerProviderStateMixin {
  var isTabs = 0;

  Timer _timer;

  var timeout = const Duration(seconds: 2);

  bool isShow = true;

  AnimationController _controller;

  VideoPlayerController video_controller;

  int dyType = 1;

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
    video_controller = VideoPlayerController.network(
        'https://www.runoob.com/try/demo_source/mov_bbb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    video_controller.setLooping(true);
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
    List tabsArr = ['推荐', '关注', '最新', '附近'];

    return AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height:
                        context.watch<AppStateData>().double_statusBarHeight,
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
                                      left: Adapt.px(20.0 * (isTabs + 1) +
                                          34 * isTabs +
                                          11),
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
                          margin: EdgeInsets.only(top: 6.0, right: 20.0),
//                          decoration: BoxDecoration(
//                            color: Colors.black
//                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Image.asset(
                                    'images/dynameic/dynameic.png',
                                    width: Adapt.px(22.0),
                                    height: Adapt.px(22.0)),
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
            Container(
              width: Adapt.px(355.0),
              alignment: Alignment.topCenter,
              child: ListView(
                padding: EdgeInsets.only(top: Adapt.px(11.0)),
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(13.0, 17.0, 13.0, 12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: Adapt.px(42.0),
                                height: Adapt.px(42.0),
                                margin: EdgeInsets.only(right: Adapt.px(9.0)),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201405%2F28%2F20140528181720_fyVk8.jpeg&refer=http%3A%2F%2Fcdn.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616380369&t=96bd137d4290cf382f95357717bda4de'),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '路飞',
                                      style: TextStyle(
                                          fontSize: Adapt.px(17),
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(51, 51, 51, 1)),
                                    ),
                                    SizedBox(
                                      height: Adapt.px(3.0),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/my/girl.png',
                                          width: Adapt.px(14.5),
                                          height: Adapt.px(14.5),
                                        ),
                                        Container(
                                          width: Adapt.px(31),
                                          height: Adapt.px(13.5),
                                          margin: EdgeInsets.only(
                                              left: Adapt.px(3.5)),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => {
                                  setState(() {
                                    print('123');
                                    video_controller.value.isPlaying
                                        ? video_controller.pause()
                                        : video_controller.play();
                                  }),
                                },
                                child: Container(
                                  width: Adapt.px(52.0),
                                  height: Adapt.px(26.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(250, 88, 237, 0.24),
                                      borderRadius:
                                          BorderRadius.circular(13.0)),
                                  child: Text(
                                    '关注',
                                    style: TextStyle(
                                        fontSize: Adapt.px(14.0),
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(250, 88, 237, 1)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Adapt.px(15.0)),
                          alignment: Alignment.topLeft,
                          child: Text(
                            '愿无岁月可回首，且以深情度余生',
                            style: TextStyle(
                                fontSize: Adapt.px(15.0),
                                color: Color.fromRGBO(51, 51, 51, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: dyType == 1 ? videoWight() : imageWight(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )));
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

  Widget videoWight() {
    return Container(
        margin: EdgeInsets.only(top: Adapt.px(10.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Center(
            child: video_controller.value.initialized
                ? Stack(overflow: Overflow.clip, children: [
                    AspectRatio(
                      aspectRatio: video_controller.value.aspectRatio,
                      child: VideoPlayer(video_controller),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: video_controller.value.isPlaying
                                ? Color.fromRGBO(0, 0, 0, 0)
                                : Color.fromRGBO(0, 0, 0, 0.4)),
                        child: InkWell(
                            onTap: () => {
                                  setState(() {
                                    video_controller.value.isPlaying
                                        ? video_controller.pause()
                                        : video_controller.play();
                                  }),
                                  if (video_controller.value.isPlaying)
                                    {
                                      _timer = Timer.periodic(timeout, (timer) {
                                        print('123');
                                        setState(() {
                                          isShow = false;
                                        });
                                      })
                                    }
                                  else
                                    {
                                      _timer.cancel(),
                                      setState(() {
                                        isShow = true;
                                      }),
                                    }
                                },
                            child: isShow
                                ? Icon(
                                    video_controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 24.0,
                                  )
                                : null),
                      ),
                    )
                  ])
                : Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: Adapt.px(200.0),
                    child: Text(
                      '正在加载...'
                    ),
                    color: Colors.black12,
                  ),
          ),
        ));
  }

  Widget imageWight() {
    return Text('321');
  }
}

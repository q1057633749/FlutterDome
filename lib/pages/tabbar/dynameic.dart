import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutterapp/provider/appState.dart';
import 'package:animations/animations.dart';

class DynameicPage extends StatefulWidget {
  @override
  DynameicPageState createState() => new DynameicPageState();
}

class DynameicPageState extends State<DynameicPage>
    with TickerProviderStateMixin {
  //  顶部切换栏
  var isTabs = 0;
  //  暂停按钮的倒计时
  Timer _timer;
  // 配置倒计时的时间
  var timeout = const Duration(seconds: 2);

  var _duration = const Duration(milliseconds: 300);
  // 控制是否显示暂停/播放
  bool isShow = true;
  // 顶部导航栏动画
  AnimationController _controller;
  // 视频控件
  VideoPlayerController video_controller;
  // 测试图片列表
  List imgUrls = [
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201506%2F08%2F20150608232319_dtysC.thumb.700_0.jpeg&refer=http%3A%2F%2Fcdn.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=c08fc8828afd5e29ce06e56f372034f7',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fgss0.baidu.com%2F-Po3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Ff9198618367adab4b15a20ac8ed4b31c8601e453.jpg&refer=http%3A%2F%2Fgss0.baidu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=01303c78b2c6ba15d03380d98dc32f77',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201805%2F08%2F20180508172551_EU3m8.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=40ebe4d4343f81f68979dba52c7fd638',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F00.minipic.eastday.com%2F20171010%2F20171010103617_671dd64c0ce9ffaba78b1dfe38378a8c_4.jpeg&refer=http%3A%2F%2F00.minipic.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=d4376ad6119c2f543fbbe37630976bf9',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0822%2Fb44cd1310d09026f6dd1f0633a1cc2a5.jpg&refer=http%3A%2F%2Ffile02.16sucai.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=b5566f0ea00454f19ac11a2f44468896',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F00.minipic.eastday.com%2F20170411%2F20170411212905_50bdd93e347e94a27eee6c5fb5ffd3e5_1.jpeg&refer=http%3A%2F%2F00.minipic.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=7db15d84587cd45e8213cc37f8d83818',
    'https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/bd3eb13533fa828b899bd27cfa1f4134960a5af0.jpg',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb.zol-img.com.cn%2Fsjbizhi%2Fimages%2F2%2F750x530%2F1352105591486.jpg&refer=http%3A%2F%2Fb.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=741ea646afade489070368d9a76cc128',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201510%2F07%2F20151007164540_a4Qhz.jpeg&refer=http%3A%2F%2Fcdn.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616577500&t=d4d5a0b428e0ac6fced0092793fc90b3'
  ];
  // 测试判断动态类型
  int dyType = 0;
  // 测试动态列表
  List listType = [0, 1, 1, 0, 1];

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
                            height: context
                                .watch<AppStateData>()
                                .double_statusBarHeight,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  20.0 * (isTabs + 1) +
                                                      34 * isTabs +
                                                      11),
                                              duration:
                                                  Duration(milliseconds: 300),
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
                                  margin:
                                      EdgeInsets.only(top: 6.0, right: 20.0),
//                          decoration: BoxDecoration(
//                            color: Colors.black
//                          ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: Adapt.px(11.0)),
                        shrinkWrap: true,
                        children: dynamicList(),
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
                    child: Text('正在加载...'),
                    color: Colors.black12,
                  ),
          ),
        ));
  }

  Widget imageWight() {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
      itemBuilder: (context, index) {
        return OpenContainer(
          transitionDuration: _duration,
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return ImagesBox(index);
          },
          openBuilder: (BuildContext context, VoidCallback _) {
            return _DetailPage(imgUrls[index]);
          },
        );
      },
      itemCount: imgUrls.length,
    );
  }

//  List<Widget> ImagesBox() {
//    List<Widget> list = new List();
//    imgUrls.map((item) => {
//          list.add(OpenContainer(
//            transitionDuration: _duration,
//            closedBuilder: (BuildContext _, VoidCallback openContainer) {
//              return Container(
//                child: ,
//              );
//            },
//            openBuilder: (BuildContext context, VoidCallback _) {
//              return _DetailPage();
//            },
//          ))
//        });
//    return list;
//  }

  List<Widget> dynamicList() {
    List<Widget> list = new List();
    for(var i = 0;i< listType.length;i++){
          list.add(Container(
            padding: EdgeInsets.fromLTRB(13.0, 17.0, 13.0, 12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
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
                                  margin: EdgeInsets.only(left: Adapt.px(3.5)),
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
                              borderRadius: BorderRadius.circular(13.0)),
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
                  child: listType[i] == 1 ? videoWight() : imageWight(),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    margin: EdgeInsets.only(top: Adapt.px(12.0)),
                    padding: EdgeInsets.fromLTRB(6.5, 3, 8.5, 3),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 246, 246, 1),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 11.0,
                          color: Color.fromRGBO(90, 90, 90, 1),
                        ),
                        SizedBox(
                          width: Adapt.px(5.0),
                        ),
                        Text(
                          '火星',
                          style: TextStyle(
                              fontSize: Adapt.px(12.0),
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        )
                      ],
                    ),
                  )
                ]),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 8.5),
                  child: Text(
                    '10小时前',
                    style: TextStyle(
                        fontSize: Adapt.px(11.0),
                        color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Adapt.px(10.0)),
                  child: Row(children: [
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            child: dyType == 1
                                ? Image.asset(
                                    'images/dynameic/dianzanon.png',
                                    width: Adapt.px(22.0),
                                    height: Adapt.px(22.0),
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    size: Adapt.px(23.0),
                                  ),
                            onTap: () => {},
                          ),
                          SizedBox(
                            width: Adapt.px(7.0),
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1),
                                fontSize: Adapt.px(11.0)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 41.5),
                      child: Row(
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.message,
                              color: Color.fromRGBO(102, 102, 102, 1),
                              size: Adapt.px(19.0),
                            ),
                            onTap: () => {},
                          ),
                          SizedBox(
                            width: Adapt.px(7.0),
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1),
                                fontSize: Adapt.px(11.0)),
                          )
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ));
        };
    return list;
  }

  Widget ImagesBox(i) {
    return Image.network(
      imgUrls[i],
      fit: BoxFit.cover,
    );
  }
}

class _DetailPage extends StatelessWidget {
  String ImgUrl;
  _DetailPage(this.ImgUrl);
  @override
  Widget build(BuildContext context) {
    print(ImgUrl);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          ImgUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

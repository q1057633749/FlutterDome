import 'package:flutter/cupertino.dart';
import 'package:flutterapp/common/common.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/provider/user.dart';
import 'package:flutterapp/provider/appState.dart';

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MainWidget(context);
  }

  Widget MainWidget(BuildContext context){
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(248, 248, 248, 1),
          body: SingleChildScrollView(
            physics:ScrollPhysics(),
            padding: EdgeInsets.only(bottom:Adapt.px(10.0)),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(bottom: 10),
//                    height: 404,
                        child: Column(
                          children: [
                            SizedBox(
                              height: context.watch<AppStateData>().double_statusBarHeight,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.5, 20, 11, 10),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipOval(
                                    child: Container(
                                        width: Adapt.px(68.5),
                                        height: Adapt.px(68.5),
                                        child:
                                        Image.asset('images/test/my_avatar.gif')
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: Adapt.px(68.5),
                                      margin: EdgeInsets.only(left: 16.5),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Text(
                                                '${context.watch<UserData>().userInfo['user_name']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(left: 5),
                                                  child: Image.asset(
                                                    'images/my/girl.png',
                                                    width: Adapt.px(16.0),
                                                    height: Adapt.px(16.0),
                                                  )),
                                            ]),
                                            Row(children: []),
                                            Container(
                                              child: Text(
                                                'ID:123456',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            )
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: Adapt.px(56.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('20',style: Theme.of(context).textTheme.bodyText1,),
                                      SizedBox(height: Adapt.px(5.0),),
                                      Text('关注',style: Theme.of(context).textTheme.headline6,)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Adapt.px(56.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('20',style: Theme.of(context).textTheme.bodyText1,),
                                      SizedBox(height: Adapt.px(5.0),),
                                      Text('粉丝',style: Theme.of(context).textTheme.headline6,)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Adapt.px(56.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('20',style: Theme.of(context).textTheme.bodyText1,),
                                      SizedBox(height: Adapt.px(5.0),),
                                      Text('动态',style: Theme.of(context).textTheme.headline6,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              width: Adapt.px(355.0),
                              height:Adapt.px(104.0),
                              decoration:BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:[
                                    Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Image.asset('images/my/message.png',width: Adapt.px(47.0),height: Adapt.px(47.0),),
                                            SizedBox(height: 8,),
                                            Text('消息')
                                          ]
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Image.asset('images/my/wallet.png',width: Adapt.px(47.0),height: Adapt.px(47.0),),
                                            SizedBox(height: 8,),
                                            Text('钱包')
                                          ]
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Image.asset('images/my/order.png',width: Adapt.px(47.0),height: Adapt.px(47.0),),
                                            SizedBox(height: 8,),
                                            Text('明细')
                                          ]
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children:[
                                            Image.asset('images/my/shop.png',width: Adapt.px(47.0),height: Adapt.px(47.0),),
                                            SizedBox(height: 8,),
                                            Text('商城')
                                          ]
                                      ),
                                    )
                                  ]
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:Adapt.px(173.0),
                                    height: Adapt.px(74.0),
                                    padding: EdgeInsets.all(18),
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('我的视频',style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Color.fromRGBO(51, 51, 51, 1),
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              Text('查看视频作品',style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromRGBO(153, 153, 153, 1)
                                              ),)
                                            ],
                                          ),
                                          Image.asset('images/my/video.png',width: Adapt.px(25.0),height: Adapt.px(25.0),)
                                        ]
                                    ),
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                  ),
                                  Container(
                                    width:173.0,
                                    height: 74.0,
                                    padding: EdgeInsets.all(18),
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('我的收益',style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Color.fromRGBO(51, 51, 51, 1),
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              Text('提现、收益兑换',style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromRGBO(153, 153, 153, 1)
                                              ),)
                                            ],
                                          ),
                                          Image.asset('images/my/earnings.png',width: Adapt.px(25.0),height: Adapt.px(25.0),)
                                        ]
                                    ),
                                    decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/my/my_head.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Image.asset('images/my/friend.png',width: Adapt.px(355.0),height:Adapt.px(95.0)),
                            Container(
                              margin: EdgeInsets.only(top: Adapt.px(14.0)),
                              child: MyModel(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget MyModel() {
    return Container(
      width: Adapt.px(355.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(19.0, 0, 18.0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Image.asset('images/my/dynamic.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                      SizedBox(width:Adapt.px(8.0),),
                      Text('我的动态',style: TextStyle(
                        fontSize:Adapt.px(15.0),
                        color: Color.fromRGBO(51, 51, 51, 1)
                      ),),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                        ),
                      )
                    ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/level.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('我的等级',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/auth.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('我的认证',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/family.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('家族中心',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.fromLTRB(19.0, 0, 18.0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/liveshop.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('直播小店',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/pamsg.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('付费内容',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/home.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('房间管理',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/equip.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('装备中心',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/family.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('家族驻地',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.fromLTRB(19.0, 0, 18.0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image.asset('images/my/liveshop.png',width:Adapt.px(20.0),height:Adapt.px(20.0),fit: BoxFit.cover,),
                        SizedBox(width:Adapt.px(8.0),),
                        Text('直播小店',style: TextStyle(
                            fontSize:Adapt.px(15.0),
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,size: 15.0,),
                          ),
                        )
                      ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

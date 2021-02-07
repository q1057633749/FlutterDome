import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/provider/user.dart';
import 'package:flutterapp/provider/appState.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 404,
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
                                  width: 68.5,
                                  height: 68.5,
                                  child:
                                      Image.asset('images/test/my_avatar.gif')
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 68.5,
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
                                                width: 16.0,
                                                height: 16.0,
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
                      ],
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/my/my_head.png'),
                      fit: BoxFit.cover,
                    )),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() => context.read<UserData>().setUserInfo({'user_name':'我是帅哥'}),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget MyModel() {
    return Text('321');
  }
}

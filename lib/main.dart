import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/pages/sign/login.dart';
import 'pages/router/router.dart';
import 'pages/tabs.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/provider/appState.dart';
import 'package:flutterapp/common/theme.dart';
import 'package:flutterapp/provider/user.dart';
import 'package:flutterapp/common/actions.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppStateData>(create: (_) => AppStateData()),
    ChangeNotifierProvider<UserData>(create: (_) => UserData())
  ], child: MyApp()));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
if (Theme.of(context).platform == TargetPlatform.android) {
// android 平台
SystemUiOverlayStyle _style =
SystemUiOverlayStyle(statusBarColor: Colors.transparent);
SystemChrome.setSystemUIOverlayStyle(_style);
}
  readBoolData('isLoginState').then((value) => {
    print(value),
    print('123111'),
    if(value){
      context.read<UserData>().setLogin()
    },
    print(context.read<UserData>().isLogin),
  });
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeStyle(),
        onGenerateRoute: onGenerateRoute,
        home: context.watch<UserData>().isLogin ? TabsPage():LoginPage());
  }
}

//class MyApp extends StatefulWidget {
//  @override
//  MyAppState createState() => new MyAppState();
//}
//
//class MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    if (Theme.of(context).platform == TargetPlatform.android) {
//      // android 平台
//      SystemUiOverlayStyle _style =
//      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//      SystemChrome.setSystemUIOverlayStyle(_style);
//    }
//    readBoolData('isLoginState').then((value) => {
//      if(value){
//        context.read<UserData>().setLogin()
//      }
//    });
//
//
//    return MaterialApp(
//        title: 'Flutter Demo',
//        debugShowCheckedModeBanner: false,
//        theme: ThemeStyle(),
//        onGenerateRoute: onGenerateRoute,
//        home: context.watch<UserData>().isLogin ? TabsPage():LoginPage());
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//  }
//
//  @override
//  void didUpdateWidget(MyApp oldWidget) {
//    // TODO: implement didUpdateWidget
//    super.didUpdateWidget(oldWidget);
//  }
//
//  @override
//  void didChangeDependencies() {
//    // TODO: implement didChangeDependencies
//    super.didChangeDependencies();
//  }
//}



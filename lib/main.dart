import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/router/router.dart';
import 'pages/tabs.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/provider/appState.dart';
import 'package:flutterapp/common/theme.dart';
import 'package:flutterapp/provider/user.dart';

void main() {
  runApp(MyApp());
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeStyle(),
        onGenerateRoute: onGenerateRoute,
        home: MultiProvider(
            providers: [
              Provider<AppStateData>(create: (_) => AppStateData()),
              Provider<UserData>(create: (_) => UserData())
            ],
            child: TabsPage()));
  }
}

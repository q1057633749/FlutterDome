import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(LivePage());
  SystemUiOverlayStyle systemUiOverlayStyle =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class Counter with ChangeNotifier {
  int _count = 1;
  Color _themeColor = Colors.blue;
  int get value => _count;
  Color get themeColor => _themeColor;
  void addValue() {
    _count++;
    notifyListeners();
  }

  Color changeThemeColor() {
    _themeColor = Colors.green;
    notifyListeners();
    return _themeColor;
  }
}

class LivePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //Counter _counter = new Counter();
  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppBar(
              title: Text(
                  "Provider页面级别的演示:${Provider.of<Counter>(context).value}"),
            ),
          ),
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Consumer(builder:
                    (BuildContext context, Counter icounter, Widget child) {
                  return Text(
                    "Consumer包裹的文本+${icounter.value}", //没有用consumer包裹的不会自动更新,只有页面重绘时才被更新
                    style: TextStyle(fontSize: 20),
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                Consumer(
                  builder:
                      (BuildContext context, Counter counter, Widget child) {
                    return RaisedButton(
                      child: Icon(Icons.add),
                      onPressed: counter.addValue,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DataWidget(), //抽离后的数据展示
              ],
            ),
          ),
        );
      }),
    );
  }
}

class DataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("局部重绘");
    return Container(
      width: double.infinity,
      color: Colors.green[100],
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Consumer(
            builder: (BuildContext context, Counter counter, Widget child) {
              return InkWell(
                child: Text("抽离后的Widget,并用consumer获取值:${counter.value}"),
                onTap: () => counter.addValue(),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ActionChip(
              label: Text(
                  "抽离后用Provider.of获取值:${Provider.of<Counter>(context).value}"),
              onPressed: Provider.of<Counter>(context).addValue),
        ],
      ),
    );
  }
}

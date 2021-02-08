import 'package:flutter/material.dart';


class AppStateData extends ChangeNotifier{
  bool _topBarColor = true;
  double _double_statusBarHeight = 0;
  bool _radioGroupValue = false;



  bool get topBarColor => _topBarColor;
  double get double_statusBarHeight => _double_statusBarHeight;
  bool get radioGroupValue => _radioGroupValue;

  void setStatusBarHeight(statusBarHeight){
    _double_statusBarHeight = statusBarHeight;
  }

  void changeBarState() {
    _topBarColor = !_topBarColor;
    notifyListeners();//要更新UI记得调用这个方法
  }

  void setChangeState(){
    _radioGroupValue = !_radioGroupValue;
    notifyListeners();

  }
}
import 'package:flutter/material.dart';


class AppStateData extends ChangeNotifier{
  bool _topBarColor = true;

  bool get topBarColor => _topBarColor;

  changeBarState() {
    _topBarColor = !_topBarColor;
    notifyListeners();//要更新UI记得调用这个方法
  }
}
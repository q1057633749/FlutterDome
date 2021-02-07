import 'package:flutter/material.dart';


class UserData extends ChangeNotifier{
  bool _isLogin = false;
  Map _userInfo = {
    'user_name':'我是美少女'
  };

  bool get isLogin => _isLogin;
  Map get userInfo => _userInfo;

  void setLogin(){
    _isLogin = true;
  }

  void setUserInfo(userMap) {
      _userInfo = userMap;
    notifyListeners();//要更新UI记得调用这个方法
  }
}
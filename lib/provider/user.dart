import 'package:flutter/material.dart';


class UserData extends ChangeNotifier{
  String _userInfo = '我是美少女';

   String get userInfo => _userInfo;


  void setUserInfo(userInfos) {
  print(_userInfo);
    if(_userInfo == '我是美少女'){
      _userInfo = '我是帅哥';
    }else{
      _userInfo ='我是美少女';
    }
    notifyListeners();//要更新UI记得调用这个方法
  }
}
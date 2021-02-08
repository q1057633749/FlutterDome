import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ColorUtil {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
// 保存简单的数据到本地
save_State( type, key,value ) async {
  var prefs = await SharedPreferences.getInstance();
  switch(type){
    case 'String':
      prefs.setString(key, value);
      break;
    case 'Bool':
      prefs.setBool(key, value);
      break;
    case 'Int':
      prefs.setInt(key, value);
      break;
    case 'Double':
      prefs.setDouble(key, value);
      break;
    case 'StringList':
      prefs.setStringList(key, value);
      break;
  }
  prefs.setBool(key , value);
}

// 获取保存到本地的数据
// string 类型
Future<String> readStringData(key) async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getString(key);
  return result ?? '';
}

// int 类型
Future<int> readIntData(key) async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getInt(key);
  return result ?? 0;
}

// Double 类型
Future<double> readDoubleData(key) async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getDouble(key);
  return result ?? 0.0;
}

//bool 类型
Future<bool> readBoolData(key) async{
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getBool(key);
  return result ?? false;
}

//bool 类型
Future<List<String>> readListData(key) async{
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getStringList(key);
  return result ?? [];
}


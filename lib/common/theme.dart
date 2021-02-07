import 'package:flutter/material.dart';

 ThemeStyle(){
    return ThemeData(

      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      hoverColor:Color.fromRGBO(255, 167, 100, 1),
      tabBarTheme: TabBarTheme(
        labelColor: Color(0xFF7C4DF9),
        unselectedLabelColor: Color(0xFF999999),
      ),
      textTheme: TextTheme(
          headline1:TextStyle(
            color:Color(0xff333333),
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          headline2:TextStyle(
              color:Color(0xff333333),
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
          headline3:TextStyle(
              color:Color(0xff000000),
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
          headline4:TextStyle(
              color:Color(0xff999999),
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),
          headline5:TextStyle(
              color:Color(0xff333333),
              fontSize: 18,
              fontWeight: FontWeight.w400
          ),
      )
    );
}
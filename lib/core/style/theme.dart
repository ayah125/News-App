import 'package:flutter/material.dart';

class Mytheme{
  static final lightTheme=  ThemeData(
primaryColor: Colors.green,
    scaffoldBackgroundColor:Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green
    ),
    textTheme:const  TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: Colors.white
      )
    )
  );
}
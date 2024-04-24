import 'package:flutter/material.dart';
import 'package:newsapp/news/news%20details.dart';
import 'package:newsapp/news/search.dart';

import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splash_view.dart';

import 'core/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: Mytheme.lightTheme,

      debugShowCheckedModeBanner: false,
      routes:{
        Splash_view.routeName:(context)=>Splash_view(),
        Home_view.routeName:(context)=>Home_view(),
        NewsDetails.routeName:(context)=>NewsDetails(),
        SearchScreen.routeName:(context)=>SearchScreen(),
      } ,
      initialRoute: Splash_view.routeName,

    );
  }
}



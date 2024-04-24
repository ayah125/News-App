import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';

class Splash_view extends StatelessWidget {
  static const String routeName='initial';
  const Splash_view({super.key});
  @override
  Widget build(BuildContext context) {
    Timer( const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Home_view.routeName);
    });
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset('assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit:BoxFit.cover
          ),

        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
        child: Image.asset('assets/images/logo.png',)
          ),
        )
      ],
    );


  }
}

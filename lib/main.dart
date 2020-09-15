import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/home/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kDarkBlue,
        accentColor: kLightOrange,
      ),
      home: SplashScreen(),
    );
  }
}

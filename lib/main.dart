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
        textTheme: _kTextTheme,
      ),
      home: SplashScreen(),
    );
  }
}

final TextTheme _kTextTheme = _buildTextTheme();

TextTheme _buildTextTheme() {
  TextTheme base = ThemeData.light().textTheme;
  return base
      .copyWith(
        headline4: base.headline4.copyWith(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          fontFamily: "OpenSansR",
        ),
        headline5: base.headline5.copyWith(
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
          color: kWhite,
          fontFamily: "OpenSansL",
        ),
        headline6: base.headline6.copyWith(
          fontSize: 23.0,
          fontWeight: FontWeight.w500,
          color: kBlack,
          fontFamily: "Akzidenz",
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          fontFamily: "OpenSansR",
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          fontFamily: "OpenSansR",
        ),
        bodyText2: base.bodyText2.copyWith(
          fontFamily: "OpenSansR",
        ),
        subtitle1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: kWhite,
          fontFamily: "OpenSansR",
        ),
      )
      .apply();
}

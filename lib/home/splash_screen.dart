import 'package:estructura_practica_1/login/main_login.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => MainLoginPage(),
          ),
        );
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(
        Duration(
          seconds: SPLASH_SCREEN_DURATION,
        ),
        () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDrakBrown,
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "coffee.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                height: 180,
                width: 180,
                child: Image.asset(
                  "cupping.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

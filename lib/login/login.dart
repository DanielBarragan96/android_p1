import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/login/register.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    "cupping.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    obscureText: false,
                    cursorColor: kWhite,
                    style: TextStyle(color: kWhite),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      labelText: 'User',
                      focusColor: kWhite,
                      labelStyle: TextStyle(color: kWhite),
                      fillColor: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    obscureText: true,
                    cursorColor: kWhite,
                    style: TextStyle(color: kWhite),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      focusColor: kWhite,
                      labelStyle: TextStyle(color: kWhite),
                      fillColor: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 60,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home(
                                    title: APP_TITLE,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text("ENTRAR"),
                          color: kDrakBrown,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "¿Olvidaste tu password?",
                  style: TextStyle(color: kWhite),
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        "¿Aún no tienes cuenta?",
                        style: TextStyle(color: kWhite),
                      ),
                      Text(
                        "REGISTRATE",
                        style: TextStyle(color: kWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

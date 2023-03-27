import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {

  late  SharedPreferences sharedPreferences;
  bool k = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpre();
    Timer.periodic(Duration(seconds: 4), (timer) {
      k = sharedPreferences.getBool("isLogin") ?? false;
      (k == false)
          ? Navigator.of(context).pushReplacementNamed('Login_page')
          : Navigator.of(context).pushReplacementNamed('/');
    });
  }

  getpre() async  {
    sharedPreferences  = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 95,
              width: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.blue,width: 2),
                color: Colors.blue[900],
                image: DecorationImage(image: AssetImage("assets/images/logo.gif")),
              ),),
          ],
        ),
      ),
    );
  }
}

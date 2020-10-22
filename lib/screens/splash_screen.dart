import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manan_mobile/screens/landing.dart';
import 'package:manan_mobile/sized_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(Duration(milliseconds: 5000), () {
      Navigator.pushReplacementNamed(context, LandingPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/splash.json"),
      ),
    );
  }
}

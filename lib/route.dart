import 'package:flutter/material.dart';
import 'package:manan_mobile/screens/home_page.dart';
import 'package:manan_mobile/screens/landing.dart';
import 'package:manan_mobile/screens/login_page.dart';
final Map<String, WidgetBuilder> routes = {

  HomePage.routeName :(context) =>HomePage(),
  LoginPage.routeName :(context) => LoginPage(),
  LandingPage.routeName:(context) =>LandingPage(),

};
import 'package:flutter/material.dart';
import 'package:manan_mobile/screens/complete_profile.dart';
import 'package:manan_mobile/screens/forget_password.dart';
import 'package:manan_mobile/screens/home_page.dart';
import 'package:manan_mobile/screens/landing.dart';
import 'package:manan_mobile/screens/otp_screen.dart';
import 'file:///C:/Users/harin/AndroidStudioProjects/manan_mobile/lib/screens/login/login_page.dart';
import 'package:manan_mobile/screens/register_page.dart';
import 'package:manan_mobile/screens/splash_screen.dart';
final Map<String, WidgetBuilder> routes = {

  HomePage.routeName :(context) =>HomePage(),
  LoginPage.routeName :(context) => LoginPage(),
  LandingPage.routeName:(context) =>LandingPage(),
  RegisterPage.routeName:(context)=>RegisterPage(),
  ForgetPassword.routeName:(context)=>ForgetPassword(),
  SplashScreen.routeName:(context)=>SplashScreen(),
  CompleteProfile.routeName:(context)=>CompleteProfile(),
  OtpScreen.routeName:(context)=>OtpScreen(),

};
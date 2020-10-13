import "package:flutter/material.dart";
import 'package:manan_mobile/route.dart';
import 'package:manan_mobile/screens/home_page.dart';
import 'package:manan_mobile/screens/landing.dart';
class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}
void main(){
  runApp(Main());
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Manan Mobile",
      debugShowCheckedModeBanner: false,
      initialRoute: LandingPage.routeName,
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
    );
  }
}

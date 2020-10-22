import "package:flutter/material.dart";
import 'package:manan_mobile/route.dart';
import 'package:manan_mobile/screens/home_page.dart';
import 'package:manan_mobile/screens/landing.dart';
import 'package:manan_mobile/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Manan Mobile",
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
      theme: ThemeData(
        primaryColor: Colors.orange,
        
      ),
    );
  }
}

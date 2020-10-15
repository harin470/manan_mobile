import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:manan_mobile/screens/home_page.dart';
import 'file:///C:/Users/harin/AndroidStudioProjects/manan_mobile/lib/screens/login/login_page.dart';

class LandingPage extends StatefulWidget {
  static String routeName ='/landing';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Text("Has Error"),
          );
        }
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, authshot) {
            if (authshot.hasError) {
              return Scaffold(
                body: Text("Has Error"),
              );
            }

            if (authshot.connectionState == ConnectionState.active) {
              User user = authshot.data;
              if (user == null) {
                return LoginPage();
              } else {
                return HomePage();
              }
            }
            return CircularProgressIndicator();
          },
        );
      },
    );
  }
}

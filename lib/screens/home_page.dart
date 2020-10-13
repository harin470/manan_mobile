import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';

class HomePage extends StatefulWidget {
  static String routeName ='/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Auth _auth =new Auth();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: (
              Text("Sign Out")
          ),
          onPressed: () async{
            User user = await _auth.signOut();
            return user;
          },
        ),
      )

    );
  }
}

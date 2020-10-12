import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName ='/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body:  Center(
                child: Text("${snapshot.hasError}"
                )
            ),
        );
        }
        if(snapshot.connectionState==ConnectionState.active){
          return HomePage();
        }
       return  CircularProgressIndicator();
      },
    );
  }
}

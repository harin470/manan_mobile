import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/models/userModel.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';
import 'package:manan_mobile/services/firestore/firestore_methods.dart';
class LoginPage extends StatelessWidget {
   final Auth _auth =new Auth();
   static String routeName ='/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: (
              Text("Sign In")
          ),
          onPressed: () async{
            UserModel user = await _auth.signInWithGoogle();
            if(user!=null){
              FirestoreMethods().addUserToFirebaseDb(user);
            }

          },
        ),
      )

    );
  }
}

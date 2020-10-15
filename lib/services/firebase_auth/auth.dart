

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manan_mobile/models/userModel.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _signIn = new GoogleSignIn();

  UserModel getFromFirebaseUser(User user){
    return user==null? null: UserModel(
      email: user.email,name: "Default",profile_picture: user.photoURL,uid: user.uid
    );
  }



  // signing with user and pass
   Future signInWithEmailAndPassword(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = credential.user;
    return user;
  }


// google signin
  Future signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _signIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential credential1 = await _auth.signInWithCredential(credential);
    User user = credential1.user;

    // Once signed in, return the UserCredential
    return getFromFirebaseUser(user) ;
  }
  //register user using email and pass
  Future registerUserWithEmailAndPass(String email, String pass) async{
    UserCredential userCrdential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    User user= userCrdential.user;
    return getFromFirebaseUser(user);
  }

  //signout
Future signOut() async{
     // await _signIn.disconnect();
     await _signIn.signOut();
     await _auth.signOut();
     return null;
}
Future resetPassword(String email) async{
    await _auth.sendPasswordResetEmail(email: email);
}
}


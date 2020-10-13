import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manan_mobile/models/userModel.dart';

class FirestoreMethods {
  FirebaseFirestore _root = FirebaseFirestore.instance;

  Future addUserToFirebaseDb(UserModel user) {
    UserModel userModel = UserModel(
        uid: user.getuid,
        profile_picture: user.getProfile_picture??"Default",
        name: user.getName??"Default",
        email: user.getemail);
    _root.collection("user").doc(user.uid).set(userModel.toMap(userModel));
  }


}

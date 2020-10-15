import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import "package:flutter/material.dart";
import 'package:manan_mobile/form_field.dart';
import 'package:manan_mobile/models/userModel.dart';
import 'package:manan_mobile/screens/login/form_error.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';
import 'package:manan_mobile/services/firestore/firestore_methods.dart';
import 'package:manan_mobile/sized_config.dart';
import 'package:manan_mobile/social_auth_ui.dart';
class CompleteProfile extends StatefulWidget {
  static String routeName = '/complete_profile';
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final Auth _auth = new Auth();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Sign Up"),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
          ),
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      "Complete Profile",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      "Complete your details or continue \n with social media ",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    CompleteProfilePage(),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocialLog(
                          icon: EvaIcons.google,
                          pressed: () async {
                            UserModel user = await _auth.signInWithGoogle();
                            if (user != null) {
                              FirestoreMethods().addUserToFirebaseDb(user);
                            }
                          },
                        ),
                        SocialLog(
                          icon: EvaIcons.facebook,
                          pressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      "By continuing you confirm that you \n agree with our Term and Condition ",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
class CompleteProfilePage extends StatefulWidget {
  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final Auth _auth = new Auth();
  FirestoreMethods _firestoreMethods = new FirestoreMethods();
  final _formCompleteProfileKey = GlobalKey<FormState>();
  final List<String> errors = [];
  static String pass;
  static String name;
  CustomFormField field = new CustomFormField();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formCompleteProfileKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: field.buildInputDecoration(
                  "Enter Your Name", "Name", EvaIcons.person, context),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains("Please Fill Name Field")) {
                  setState(() {
                    errors.remove("Please Fill Name Field");
                  });
                }
                return null;
              },
              onSaved: (value){
                setState(() {
                  name =value;
                });
              },
              validator: (value) {
                // var emailNull = "Please Enter Your Email";
                // if (value.isEmpty && !errors.contains(emailNull)) {
                //   setState(() {
                //     errors.add(emailNull);
                //   });
                // }
                if (value.isEmpty&& !errors.contains("Please Fill Name Field")) {
                  setState(() {
                    errors.add("Please Fill Name Field");
                  });
                }
                return null;
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            TextFormField(
                onSaved: (value) {
                  setState(() {
                    pass = value;
                  });
                },
                decoration: field.buildInputDecoration(
                    "Enter Your Phone Number",
                    "Phone Number",
                    EvaIcons.phone,
                    context),

                onChanged: (value) {
                  var phoneNull = "Please Enter Phone Number";
                  if (value.isNotEmpty && errors.contains(phoneNull)) {
                    setState(() {
                      errors.remove(phoneNull);
                    });
                  }
                },
                validator: (value) {
                  var phoneNull = "Please Enter Phone Number";
                  if (value.isEmpty && !errors.contains(phoneNull)) {
                    setState(() {
                      errors.add(phoneNull);
                    });
                  }
                  return null;
                }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            TextFormField(
                decoration: field.buildInputDecoration("Address",
                    "Enter Your Address", EvaIcons.pinOutline, context),

                onChanged: (value) {
                  var addressNull = "Please Enter Address";

                  if (value.isNotEmpty && errors.contains(addressNull)) {
                    setState(() {
                      errors.remove(addressNull);
                    });
                  }

                },
                onSaved: (value){

                },
                validator: (value) {
                  var addressNull = "Please Enter Address";
                  if (value.isEmpty && !errors.contains(addressNull)) {
                    setState(() {
                      errors.add(addressNull);
                    });
                  }

                  return null;
                }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FormError(
              errors: errors,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            field.customBtn(context, "Continue", () async {
              if (_formCompleteProfileKey.currentState.validate()) {
                _formCompleteProfileKey.currentState.save();
                if(errors.length==0){
                  // await _auth.registerUserWithEmailAndPass(email, pass).then((value){
                  //   if(value != null){
                  //     _firestoreMethods.addUserToFirebaseDb(value);
                  //     Navigator.pop(context);
                  //   }
                  // });


                }
              }
            }),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
          ],
        ));
  }
}

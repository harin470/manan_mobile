import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/form_field.dart';
import 'package:manan_mobile/models/userModel.dart';
import 'package:manan_mobile/screens/complete_profile.dart';
import 'package:manan_mobile/screens/login/form_error.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';
import 'package:manan_mobile/services/firestore/firestore_methods.dart';
import 'package:manan_mobile/sized_config.dart';
import 'package:manan_mobile/social_auth_ui.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  "Register Account",
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
                RegisterForm(),
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

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final Auth _auth = new Auth();

  FirestoreMethods _firestoreMethods = new FirestoreMethods();
  final _formForgetPasswordKey = GlobalKey<FormState>();
  final List<String> errors = [];
  static String pass;
  static String email;
  CustomFormField field = new CustomFormField();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formForgetPasswordKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: field.buildInputDecoration(
                  "Enter Your Email....", "Email", EvaIcons.email, context),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                if ((EmailValidator.validate(value)) &&
                    errors.contains("Invalid Email")) {
                  setState(() {
                    errors.remove("Invalid Email");
                  });
                }
                return null;
              },
              onSaved: (value){
                setState(() {
                  email =value;
                });
              },
              validator: (value) {
                // var emailNull = "Please Enter Your Email";
                // if (value.isEmpty && !errors.contains(emailNull)) {
                //   setState(() {
                //     errors.add(emailNull);
                //   });
                // }
                if ((!EmailValidator.validate(value)) &&
                    !errors.contains("Invalid Email")) {
                  setState(() {
                    errors.add("Invalid Email");
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
                    "Enter Your Password....",
                    "Password",
                    EvaIcons.lock,
                    context),
                obscureText: true,
                onChanged: (value) {
                  var passNull = "Please Enter Password";
                  if (value.isNotEmpty && errors.contains(passNull)) {
                    setState(() {
                      errors.remove(passNull);
                    });
                  }
                },
                validator: (value) {
                  var passNull = "Please Enter Password";
                  if (value.isEmpty && !errors.contains(passNull)) {
                    setState(() {
                      errors.add(passNull);
                    });
                  }
                  return null;
                }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            TextFormField(
                decoration: field.buildInputDecoration("Rewrite password",
                    "Rewrite Password", EvaIcons.lock, context),
                obscureText: true,
                onChanged: (value) {
                  var passNull = "Please Enter Password";

                  if (value.isNotEmpty && errors.contains(passNull)) {
                    setState(() {
                      errors.remove(passNull);
                    });
                  }

                },
                onSaved: (value){
                  var passNotMatch ="Both password did not match";
                  if (value == pass) {
                    setState(() {
                      errors.remove(passNotMatch);
                    });
                  }
                },
                validator: (value) {
                  var passNull = "Please Enter Password";
                  var passNotMatch ="Both password did not match";
                  if (value.isEmpty && !errors.contains(passNull)) {
                    setState(() {
                      errors.add(passNull);
                    });
                  }
                  if (value != pass) {
                    setState(() {if(!errors.contains(passNull)&&!errors.contains(passNotMatch)) {
                      errors.add(passNotMatch);
                    }
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
              if (_formForgetPasswordKey.currentState.validate()) {
                _formForgetPasswordKey.currentState.save();
                if(errors.length==0){
                  await _auth.registerUserWithEmailAndPass(email, pass).then((value){
                    if(value != null){
                      _firestoreMethods.addUserToFirebaseDb(value);
                      Navigator.pop(context);
                    }
                  });
                  //     Navigator.pushNamed(context, CompleteProfile.routeName);

                }
              }
            }),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
          ],
        ));
  }
}

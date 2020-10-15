import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/models/userModel.dart';
import 'package:manan_mobile/no_account_form.dart';
import 'package:manan_mobile/screens/forget_password.dart';
import 'package:manan_mobile/screens/login/form_error.dart';
import 'package:manan_mobile/screens/register_page.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';
import 'package:manan_mobile/services/firestore/firestore_methods.dart';
import 'package:manan_mobile/sized_config.dart';
import 'package:manan_mobile/form_field.dart';
import 'package:manan_mobile/social_auth_ui.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Auth _auth = new Auth();

  var hintext;

  var labeltext;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(25),
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Sign in with your Email and Password \nor Continue with Social Media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: getProportionateScreenWidth(15)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                  ),
                  SignInForm(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
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
                          }),
                      SocialLog(
                        icon: EvaIcons.facebook,
                        pressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  NoAccountForm(),
                ],
              ),
            ),
          ),
        ),
      ),

      //   body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // children: <Widget>[
      //   Text(
      //     "Log In",
      //     style: TextStyle(
      //         fontWeight: FontWeight.w700,
      //         fontSize: 26.0,
      //         color: Colors.orange),
      //   ),
      //   Container(
      //     height: 160.0,
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: TextFormField(
      //       autocorrect: false,
      //       style: TextStyle(color: Colors.black),
      //       decoration: new InputDecoration(
      //         fillColor: Colors.white,
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //             borderSide: BorderSide(color: Colors.orange)),
      //         filled: true,
      //         contentPadding:
      //             EdgeInsets.only(bottom: 10.0, left: 20.0, right: 10.0),
      //         labelText: "Email",
      //       ),
      //       onSaved: (String newValue) {},
      //     ),
      //   ),
      //   Container(
      //     height: 5.0,
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: TextFormField(
      //       autocorrect: false,
      //       style: TextStyle(color: Colors.black),
      //       decoration: new InputDecoration(
      //           fillColor: Colors.white,
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //               borderSide: BorderSide(color: Colors.orange)),
      //           filled: true,
      //           contentPadding:
      //               EdgeInsets.only(bottom: 10.0, left: 20.0, right: 10.0),
      //           labelText: "Password",
      //           focusColor: Colors.orange),
      //       onSaved: (String newValue) {},
      //     ),
      //   ),
      //   // MaterialButton(height: 20.0,focusElevation: 5.0,
      //   //   child: Text(
      //   //     "Submit",
      //   //     style: TextStyle(
      //   //         color: Colors.white,
      //   //         fontSize: 20.0,
      //   //         fontWeight: FontWeight.w700),
      //   //   ),
      //   // )
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(width: MediaQuery.of(context).size.width,
      //       child: Center(
      //         child: Text(
      //           "Submit",
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20.0,
      //               fontWeight: FontWeight.w600,),
      //         ),
      //       ),
      //       height: 40.0,
      //
      //       decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(20.0)),
      //     ),
      //   )
      // ],
      // // child: RaisedButton(
      // //   child: (
      // //       Text("Sign In")
      // //   ),
      // //   onPressed: () async{
      // //     UserModel user = await _auth.signInWithGoogle();
      // //     if(user!=null){
      // //       FirestoreMethods().addUserToFirebaseDb(user);
      // //     }
      // //
      // //   },
      // // ),
      // )
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final Auth _auth = new Auth();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  CustomFormField field = new CustomFormField();
  bool remember = false;
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                email=value;
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
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
              decoration: field.buildInputDecoration("Enter Your Password....",
                  "Password", EvaIcons.lock, context),
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
                setState(() {
                  pass=value;
                });
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
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: remember,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember Me"),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPassword.routeName);
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          field.customBtn(context, "Continue", () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
            if(errors.length==0){
              _auth.signInWithEmailAndPassword(email, pass);
              Navigator.pop(context);
            }
          }),
        ],
      ),
    );
  }
}

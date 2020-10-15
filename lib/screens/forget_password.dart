import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:manan_mobile/form_field.dart';
import 'package:manan_mobile/no_account_form.dart';
import 'package:manan_mobile/screens/login/form_error.dart';
import 'package:manan_mobile/services/firebase_auth/auth.dart';
import 'package:manan_mobile/sized_config.dart';
class ForgetPassword extends StatelessWidget {
  static String routeName = '/forget_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forget Password"),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight*0.04),
                Text("Forget Password",style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,

                ),),
                SizedBox(height: getProportionateScreenHeight(20),),
                Text("Please enter your email we will send \nyou a link  to return to your account ",
                textAlign: TextAlign.center,),
                SizedBox(height: SizeConfig.screenHeight*0.1),
                ForgetPasswordForm(),

                NoAccountForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formForgetPasswordKey = GlobalKey<FormState>();
  final List<String> errors=[];
  String email;
  CustomFormField field =new CustomFormField();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formForgetPasswordKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: field.buildInputDecoration(
                "Enter Your Email....", "Email", EvaIcons.email,context),
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
          FormError(errors: errors,),
          SizedBox(height: SizeConfig.screenHeight*0.1),

          field.customBtn(context, "Continue",() async{
            if (_formForgetPasswordKey.currentState.validate()) {
              _formForgetPasswordKey.currentState.save();
            }
            if(errors.length==0){
              await Auth().resetPassword(email);
            }
          } ),
          SizedBox(height: SizeConfig.screenHeight*0.1),

        ],
      )

    );
  }



}

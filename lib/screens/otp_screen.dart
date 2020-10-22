import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:manan_mobile/form_field.dart';
import 'package:manan_mobile/sized_config.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = '/otp_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("OTP verification"),
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
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "We send a code to  +91 99999*****\n with social media ",
                  textAlign: TextAlign.center,
                ),
                buildTimer(),
                SizedBox(height: SizeConfig.screenHeight*0.15,),
                OtpForm(),
                SizedBox(height: SizeConfig.screenHeight*0.1,),
                GestureDetector(
                  onTap: (){},
                    child: Text("Resend OTP code",style: TextStyle(decoration: TextDecoration.underline),))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  CustomFormField field = new CustomFormField();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }
  void nextField(String value,FocusNode focusNode){
    if(value.length==1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInpDecoration(),
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInpDecoration(),
                    onChanged: (value) {
                      nextField(value, pin3FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInpDecoration(),
                    onChanged: (value) {
                      nextField(value, pin4FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                    decoration: otpInpDecoration(),
                    onChanged: (value) {
                      pin4FocusNode.unfocus();
                    },
                  ),
                )
              ]),
          SizedBox(height: SizeConfig.screenHeight*0.15,),
          field.customBtn(context, "Continue", (){})

        ],
      ),
    );
  }

  InputDecoration otpInpDecoration() {
    return InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
        enabledBorder: otpOutlineBorder(),
        focusedBorder: otpOutlineBorder(),
        border: otpOutlineBorder());
  }

  OutlineInputBorder otpOutlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.orange));
  }
}

import 'package:flutter/material.dart';
import 'package:manan_mobile/sized_config.dart';
class CustomFormField{
  InputDecoration buildInputDecoration(
      String hinttext, String labeltext, IconData icon,BuildContext context) {
    return InputDecoration(
        hintText: hinttext,
        labelText: labeltext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: buildOutlineInputBorder(context),
        focusedBorder: buildOutlineInputBorder(context),
        border: buildOutlineInputBorder(context),
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
              getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
          child: Icon(icon),
        ));
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color:Theme.of(context).primaryColor),
        gapPadding: 10);
  }
  SizedBox customBtn(BuildContext context,String text,Function press) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(20)),
        ),
        onPressed: press,
        color: Theme
            .of(context)
            .primaryColor,
      ),);
  }

}
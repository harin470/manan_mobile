import "package:flutter/material.dart";
import 'package:manan_mobile/screens/register_page.dart';
import 'package:manan_mobile/sized_config.dart';
class NoAccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have An Account?  ",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, RegisterPage.routeName);
            },
            child: Text("Sign Up",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline)))
      ],
    );
  }
}

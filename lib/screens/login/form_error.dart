import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import "package:flutter/material.dart";
import 'package:manan_mobile/sized_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(errors[index],context)));
  }

  Row formErrorText(String text,BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(
            EvaIcons.bulb,
            size: getProportionateScreenHeight(20),
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: getProportionateScreenWidth(16)),
          ),
        )
      ],
    );
  }
}
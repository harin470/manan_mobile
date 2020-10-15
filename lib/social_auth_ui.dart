import 'package:flutter/material.dart';
import 'package:manan_mobile/sized_config.dart';

class SocialLog extends StatelessWidget {
  const SocialLog({
    this.icon,
    this.pressed,
    Key key,
  }) : super(key: key);
  final IconData icon;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        alignment: Alignment.center,
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: Center(child:Icon(
          icon,
          size: getProportionateScreenWidth(25),
        ),
      ),)
    );
  }
}

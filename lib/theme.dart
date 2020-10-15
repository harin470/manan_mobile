import 'package:flutter/material.dart';

OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.orange),
    gapPadding: 10
);
InputDecoration inputDecoration = InputDecoration(

    contentPadding: EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 20
    ),
    enabledBorder: outlineBorder,
    focusedBorder: outlineBorder,
    border: outlineBorder
);
import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Wa",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      Text(
        "lly",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w600,
          fontSize: 27,
        ),
      ),
    ],
  );
}

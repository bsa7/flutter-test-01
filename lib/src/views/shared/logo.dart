import 'package:flutter/material.dart';

Widget logo({ BuildContext context }) {

  return Padding(
    padding: EdgeInsets.only(top: 50),
    child: Container(
      child: Align(
        child: Text('APP NAME', style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
        )),
      ),
    ),
  );
}
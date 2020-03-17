import 'package:flutter/material.dart';

Widget logo() {
  return Padding(
    padding: EdgeInsets.only(top: 100),
    child: Container(
      child: Align(
        child: Text('MAXFIT', style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
      ),
    ),
  );
}
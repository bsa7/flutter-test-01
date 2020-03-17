import 'package:flutter/material.dart';

Widget button({ BuildContext context, String text, void onPressed() }) {
  return RaisedButton(
    splashColor: Theme.of(context).primaryColor,
    highlightColor: Theme.of(context).primaryColor,
    color: Colors.white,
    child: Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: onPressed,
  );
}

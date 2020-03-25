import 'package:flutter/material.dart';

Widget button({ bool actionInProgress, BuildContext context, String text, void onPressed() }) {
  final ThemeData currentTheme = Theme.of(context);

  return RaisedButton(
    color: currentTheme.primaryColor,
    child: Text(
      actionInProgress ? 'WAIT PLEASE...' : text,
      style: TextStyle(
        color: currentTheme.backgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    highlightColor: currentTheme.backgroundColor,
    onPressed: actionInProgress ? null : onPressed,
    splashColor: currentTheme.backgroundColor,
  );
}
